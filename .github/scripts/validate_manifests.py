#!/usr/bin/env python3
"""Validate tool manifests against Captain's validate endpoint.

    python3 .github/scripts/validate_manifests.py <toolset.yml>...

Each file is sent as raw YAML. Issues are printed as GitHub Actions error
annotations on the offending line, and the script exits non-zero if any
manifest is invalid or cannot be checked.
"""

import json
import os
import sys
import urllib.error
import urllib.request

VALIDATE_URL = os.environ.get("CAPTAIN_VALIDATE_URL", "https://chatwoot.com/api/captain/tools/validate")
TIMEOUT = 30


def annotate(path, message, line=None, col=None):
    location = f"file={path}"
    if line:
        location += f",line={line},col={col or 1}"
    # Workflow commands end at a newline, so encode the characters GitHub reserves
    message = message.replace("%", "%25").replace("\r", "%0D").replace("\n", "%0A")
    print(f"::error {location}::{message}")


def position(text, offset):
    before = text[:offset]
    return before.count("\n") + 1, offset - (before.rfind("\n") + 1) + 1


def validate(path):
    with open(path, encoding="utf-8") as file:
        text = file.read()

    request = urllib.request.Request(
        VALIDATE_URL,
        data=text.encode("utf-8"),
        headers={"Content-Type": "text/yaml", "Accept": "application/json"},
        method="POST",
    )
    try:
        with urllib.request.urlopen(request, timeout=TIMEOUT) as response:
            result = json.load(response)
    except urllib.error.HTTPError as error:
        annotate(path, f"Validator returned HTTP {error.code}: {error.read().decode('utf-8', 'replace')[:500]}")
        return False
    except (urllib.error.URLError, TimeoutError, json.JSONDecodeError) as error:
        annotate(path, f"Could not reach the validator at {VALIDATE_URL}: {error}")
        return False

    if result.get("valid"):
        print(f"✓ {path}")
        return True

    print(f"✗ {path}")
    diagnostics = result.get("diagnostics") or []
    for diagnostic in diagnostics:
        start = diagnostic.get("start")
        line, col = position(text, start) if isinstance(start, int) else (None, None)
        annotate(path, diagnostic.get("message", "Invalid manifest"), line, col)
    if not diagnostics:
        for issue in result.get("issues") or ["Invalid manifest"]:
            annotate(path, issue)
    return False


def main(paths):
    if not paths:
        print("No tool manifests changed.")
        return 0
    results = [validate(path) for path in paths]
    return 0 if all(results) else 1


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
