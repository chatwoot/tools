# /// script
# requires-python = ">=3.11"
# dependencies = [
#   "httpx>=0.27",
#   "python-dotenv>=1.0",
#   "python-liquid>=2.0",
#   "pyyaml>=6.0",
#   "rich>=13.7",
# ]
# ///
"""Run Captain toolset tools against their real APIs.

    uv run tool-tester.py <toolset> [tool_id] [--full] [--dry-run]

<toolset> is a folder in this repository, such as stripe or cal-com.
Without a tool_id, every tool in the toolset runs one after another.

Inputs and secrets are prompted once per run. Secrets are read from
.env as <TOOLSET>_<NAME> (for example STRIPE_API_KEY or CAL_COM_API_KEY)
and offered as the default; press Enter to keep one or type a new value.
New secrets can be saved back to .env, which is git-ignored.
"""

from __future__ import annotations

import argparse
import base64
import json
import os
import sys
import time
from dataclasses import dataclass
from pathlib import Path

import httpx
import liquid
import yaml
from dotenv import dotenv_values, load_dotenv, set_key
from rich.console import Console, Group
from rich.markup import escape
from rich.padding import Padding
from rich.panel import Panel
from rich.prompt import Confirm, Prompt
from rich.syntax import Syntax
from rich.table import Table
from rich.text import Text

ROOT = Path(__file__).resolve().parent
ENV_FILE = ROOT / ".env"
FILE_VARS: set[str] = set()  # env vars that came from .env, not the shell
PREVIEW_LINES = 40

console = Console(highlight=False)


class Ask(Prompt):
    prompt_suffix = " "

liquid_env = liquid.Environment(undefined=liquid.StrictUndefined)


@dataclass
class Result:
    tool_id: str
    status: str  # ok | failed | skipped | dry-run
    code: int | None = None
    elapsed_ms: int | None = None
    note: str = ""


class ToolError(Exception):
    pass


# ── Loading ──────────────────────────────────────────────────────────────────


def available_toolsets() -> list[str]:
    return sorted(p.parent.name for p in ROOT.glob("*/toolset.yml"))


def load_toolset(folder: str) -> dict:
    path = ROOT / folder / "toolset.yml"
    if not path.exists():
        names = ", ".join(available_toolsets()) or "none"
        fail(f"No toolset named [bold]{escape(folder)}[/]. Available: {names}")
    return yaml.safe_load(path.read_text())


def fail(message: str) -> None:
    console.print(f"[red]✗[/] {message}")
    sys.exit(1)


# ── Prompts ──────────────────────────────────────────────────────────────────


def env_name(folder: str, key: str) -> str:
    return f"{folder}_{key}".upper().replace("-", "_")


def ask_field(key: str, spec: dict, default: str | None = None, source: str = "") -> object:
    """Prompt for one input, secret, or tool parameter. Blank keeps the default."""
    kind = spec.get("type", "string")
    required = spec.get("required", False)

    title = spec.get("label", key)
    label = Text.assemble(
        ("  " + title, "bold"),
        (f"  {key} · {kind}" if title != key else f"  {kind}", "dim"),
        ("  required" if required else "  optional", "yellow" if required else "dim"),
    )
    console.print(label)
    if description := spec.get("description"):
        console.print(f"  [dim]{escape(description)}[/]")
    if default:
        shown = mask(default) if kind == "password" else default
        console.print(f"  [dim]Enter to keep[/] [green]{escape(shown)}[/] [dim]from {source}[/]")

    if kind == "boolean":
        return Confirm.ask("  [cyan]›[/]", default=False)

    options = spec.get("options") or None
    while True:
        raw = Ask.ask(
            "  [cyan]›[/]",
            password=kind == "password",
            choices=options,
            default=None if required or options else "",
            show_default=False,
        )
        raw = (raw or "").strip()
        if not raw and default:
            return coerce(default, kind, key)
        if not raw:
            if required:
                console.print("  [red]This value is required.[/]")
                continue
            return ""
        try:
            return coerce(raw, kind, key)
        except ToolError as error:
            console.print(f"  [red]{error}[/]")


def coerce(raw: str, kind: str, key: str) -> object:
    try:
        if kind == "integer":
            return int(raw)
        if kind == "number":
            return float(raw)
    except ValueError:
        raise ToolError(f"{key} must be {'an' if kind[0] in 'aeiou' else 'a'} {kind}.") from None
    if kind == "boolean":
        return raw.lower() in {"1", "true", "yes", "y"}
    return raw


def collect_install_values(folder: str, toolset: dict) -> tuple[dict, dict]:
    inputs_spec = toolset.get("inputs") or {}
    secrets_spec = toolset.get("secrets") or {}
    if not inputs_spec and not secrets_spec:
        return {}, {}

    section("Setup")
    inputs = {}
    for key, spec in inputs_spec.items():
        var = env_name(folder, key)
        inputs[key] = ask_field(key, spec, os.environ.get(var), f"${var}")

    secrets, changed = {}, {}
    for key, spec in secrets_spec.items():
        var = env_name(folder, key)
        current = os.environ.get(var)
        value = ask_field(key, {"type": "password", **spec}, current, env_source(var))
        secrets[key] = value
        if value and str(value) != current:
            changed[var] = str(value)

    if changed and Confirm.ask(f"\n  Save {len(changed)} secret{'s' * (len(changed) != 1)} to .env?", default=True):
        save_secrets(changed)
    return inputs, secrets


def env_source(var: str) -> str:
    return ".env" if var in FILE_VARS else f"${var}"


def save_secrets(values: dict[str, str]) -> None:
    ENV_FILE.touch(mode=0o600, exist_ok=True)
    ENV_FILE.chmod(0o600)
    for var, value in values.items():
        set_key(ENV_FILE, var, value, quote_mode="always")
    console.print(f"  [green]✓[/] Saved {', '.join(values)} to .env")


# ── Rendering & requests ─────────────────────────────────────────────────────


def render(template: str, context: dict) -> str:
    # Install-time ${{ inputs.x }} / ${{ secrets.x }} share the Liquid context
    # with call-time {{ x }} values, so both resolve in a single pass.
    source = template.replace("${{", "{{")
    try:
        return liquid_env.from_string(source).render(**context)
    except liquid.exceptions.LiquidError as error:
        raise ToolError(f"Template error: {error}") from None


def build_request(toolset: dict, tool: dict, context: dict) -> httpx.Request:
    url = render(tool["endpoint_url"], context)
    headers = {str(k): str(v) for k, v in (toolset.get("headers") or {}).items()}
    params: dict[str, str] = {}
    auth_type = tool.get("auth_type", "none")
    auth = {k: render(str(v), context) for k, v in (tool.get("auth_config") or {}).items()}

    if auth_type == "bearer":
        headers["Authorization"] = f"Bearer {auth['token']}"
    elif auth_type == "api_key":
        if auth.get("location", "header") == "query":
            params[auth["name"]] = auth["key"]
        else:
            headers[auth["name"]] = auth["key"]
    elif auth_type == "basic":
        pair = f"{auth.get('username', '')}:{auth.get('password', '')}".encode()
        headers["Authorization"] = f"Basic {base64.b64encode(pair).decode()}"
    elif auth_type != "none":
        console.print(f"  [yellow]! Unknown auth_type {auth_type!r}; sending without auth.[/]")

    body = None
    if template := tool.get("request_template"):
        body = render(template, context)
        try:
            json.loads(body)
            headers.setdefault("Content-Type", "application/json")
        except ValueError:
            pass

    # Merge rather than pass params=, which would drop the endpoint's own query string.
    url = httpx.URL(url).copy_merge_params(params)
    return httpx.Request(tool["http_method"], url, headers=headers, content=body)


def mask(value: str) -> str:
    return f"{value[:3]}…••••" if len(value) >= 8 else "••••"


def redact(text: str, secrets: dict) -> str:
    for value in secrets.values():
        value = str(value)
        if len(value) >= 4:
            text = text.replace(value, mask(value))
    return text


# ── Output ───────────────────────────────────────────────────────────────────


def section(title: str, subtitle: str = "") -> None:
    console.print()
    label = f"[bold]{escape(title)}[/]" + (f"  [dim]{escape(subtitle)}[/]" if subtitle else "")
    console.rule(label, align="left", style="grey37")


def show_header(folder: str, toolset: dict) -> None:
    tools = toolset.get("tools") or []
    meta = Text.assemble(
        (toolset.get("category", "Others"), "cyan"),
        ("  ·  ", "dim"),
        (f"v{toolset.get('version', '?')}", "dim"),
        ("  ·  ", "dim"),
        (f"{len(tools)} tool{'s' * (len(tools) != 1)}", "dim"),
    )
    body = Group(meta, Text(toolset.get("description", ""), style="default"))
    console.print(
        Panel(
            body,
            title=f"[bold]{escape(toolset.get('name', folder))}[/]",
            title_align="left",
            border_style="grey37",
            padding=(0, 1),
        )
    )


def show_request(request: httpx.Request, secrets: dict, dry_run: bool) -> None:
    console.print()
    method = Text(f" {request.method} ", style="bold black on cyan")
    console.print(Text.assemble("  ", method, " ", redact(str(request.url), secrets)))
    shown = {k: v for k, v in request.headers.items() if k.lower() not in {"host", "content-length"}}
    if dry_run or len(shown) > 0:
        for key, value in shown.items():
            console.print(f"  [dim]{escape(key)}:[/] {escape(redact(value, secrets))}")
    if request.content:
        body = redact(request.content.decode(), secrets)
        console.print(Padding(pretty(body, full=True), (0, 0, 0, 2)))


def show_response(response: httpx.Response, elapsed_ms: int, full: bool, tool: dict) -> None:
    code = response.status_code
    color = "green" if code < 300 else "yellow" if code < 400 else "red"
    size = len(response.content)
    size_text = f"{size / 1024:.1f} KB" if size >= 1024 else f"{size} B"
    console.print()
    console.print(
        Text.assemble(
            "  ",
            (f" {code} ", f"bold black on {color}"),
            " ",
            (response.reason_phrase, color),
            (f"  ·  {elapsed_ms} ms  ·  {size_text}", "dim"),
        )
    )

    text = response.text
    if template := tool.get("response_template"):
        try:
            data = response.json()
        except ValueError:
            data = text
        try:
            rendered = render(template, {"response": data, "r": data})
            console.print(
                Panel(rendered, title="response_template", title_align="left", border_style="magenta")
            )
        except ToolError as error:
            console.print(f"  [red]{escape(str(error))}[/]")

    if text.strip():
        console.print(Padding(pretty(text, full), (1, 0, 0, 2)))


def pretty(text: str, full: bool):
    try:
        text = json.dumps(json.loads(text), indent=2, ensure_ascii=False)
        lexer = "json"
    except ValueError:
        lexer = "text"

    lines = text.splitlines()
    hidden = 0 if full else max(0, len(lines) - PREVIEW_LINES)
    if hidden:
        text = "\n".join(lines[:PREVIEW_LINES])

    syntax = Syntax(text, lexer, theme="ansi_dark", background_color="default", word_wrap=True)
    if not hidden:
        return syntax
    note = Text(f"… {hidden} more lines  (--full to show everything)", style="dim italic")
    return Group(syntax, note)


def show_summary(results: list[Result]) -> None:
    section("Summary")
    table = Table(box=None, show_header=False, padding=(0, 2, 0, 2))
    icons = {"ok": "[green]✓[/]", "failed": "[red]✗[/]", "skipped": "[dim]–[/]", "dry-run": "[cyan]◇[/]"}
    for r in results:
        code = "" if r.code is None else f"[{'green' if r.code < 300 else 'red'}]{r.code}[/]"
        elapsed = "" if r.elapsed_ms is None else f"[dim]{r.elapsed_ms} ms[/]"
        table.add_row(icons[r.status], r.tool_id, code, elapsed, f"[dim]{escape(r.note)}[/]")
    console.print(table)


# ── Main flow ────────────────────────────────────────────────────────────────


def run_tool(toolset: dict, tool: dict, base: dict, secrets: dict, args) -> Result:
    tool_id = tool["id"]
    params = {}
    for param in tool.get("param_schema") or []:
        params[param["name"]] = ask_field(param["name"], param)

    try:
        request = build_request(toolset, tool, {**base, **params})
    except (ToolError, KeyError) as error:
        note = f"missing auth_config {error}" if isinstance(error, KeyError) else str(error)
        console.print(f"  [red]✗ {escape(note)}[/]")
        return Result(tool_id, "failed", note=note.splitlines()[0])

    show_request(request, secrets, args.dry_run)
    if args.dry_run:
        return Result(tool_id, "dry-run")

    if request.method != "GET" and not Confirm.ask(
        f"\n  [yellow]Send this {request.method} request?[/]", default=False
    ):
        return Result(tool_id, "skipped", note="not sent")

    started = time.perf_counter()
    try:
        with console.status("  Waiting for response…", spinner="dots"):
            with httpx.Client(timeout=args.timeout, follow_redirects=True) as client:
                response = client.send(request)
    except httpx.HTTPError as error:
        console.print(f"\n  [red]✗ {escape(type(error).__name__)}: {escape(str(error))}[/]")
        return Result(tool_id, "failed", note=type(error).__name__)
    elapsed_ms = round((time.perf_counter() - started) * 1000)

    show_response(response, elapsed_ms, args.full, tool)
    status = "ok" if response.is_success else "failed"
    return Result(tool_id, status, response.status_code, elapsed_ms, response.reason_phrase if status == "failed" else "")


def main() -> None:
    parser = argparse.ArgumentParser(description="Run Captain toolset tools against their real APIs.")
    parser.add_argument("toolset", nargs="?", help="toolset folder, such as stripe or cal-com")
    parser.add_argument("tool", nargs="?", help="tool id; runs every tool when omitted")
    parser.add_argument("--full", action="store_true", help="show complete response bodies")
    parser.add_argument("--dry-run", action="store_true", help="print requests without sending them")
    parser.add_argument("--timeout", type=float, default=30, help="request timeout in seconds (default 30)")
    args = parser.parse_args()

    if not args.toolset:
        parser.print_usage()
        fail(f"Choose a toolset: {', '.join(available_toolsets())}")

    global FILE_VARS
    if ENV_FILE.exists():
        FILE_VARS = {k for k in dotenv_values(ENV_FILE) if k not in os.environ}
        load_dotenv(ENV_FILE, override=False)

    toolset = load_toolset(args.toolset)
    tools = [t for t in toolset.get("tools") or [] if t.get("enabled", True)]
    if args.tool:
        tools = [t for t in tools if t["id"] == args.tool]
        if not tools:
            ids = ", ".join(t["id"] for t in toolset.get("tools") or [])
            fail(f"No tool [bold]{escape(args.tool)}[/] in {args.toolset}. Available: {ids}")

    show_header(args.toolset, toolset)
    if args.dry_run:
        console.print("  [cyan]Dry run:[/] requests are printed, not sent.")

    inputs, secrets = collect_install_values(args.toolset, toolset)
    base = {"inputs": inputs, "secrets": secrets}

    results: list[Result] = []
    single = len(tools) == 1
    for index, tool in enumerate(tools, 1):
        counter = "" if single else f"[{index}/{len(tools)}]  "
        section(f"{counter}{tool['title']}", tool["id"])
        console.print(f"  [dim]{escape(tool.get('description', ''))}[/]")

        if not single:
            answer = Prompt.ask("\n  Run this tool?", choices=["y", "n", "q"], default="y")
            if answer == "q":
                results += [Result(t["id"], "skipped") for t in tools[index - 1 :]]
                break
            if answer == "n":
                results.append(Result(tool["id"], "skipped"))
                continue
        console.print()
        results.append(run_tool(toolset, tool, base, secrets, args))

    if not single:
        show_summary(results)
    console.print()


if __name__ == "__main__":
    try:
        main()
    except (KeyboardInterrupt, EOFError):
        console.print("\n[dim]Stopped.[/]")
        sys.exit(130)
