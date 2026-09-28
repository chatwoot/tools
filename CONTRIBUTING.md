# Contributing

Toolsets are added to the [Captain tools catalog](https://www.chatwoot.com/captain/tools) by pull request to this repository. The Chatwoot team reviews each one before it's published, so anyone can contribute a toolset for a service they use.

Before starting a new toolset, check the existing folders and [open issues](https://github.com/chatwoot/tools/issues) to avoid duplicating work. For a large toolset or an unusual service, open an issue first to agree on the scope.

## Add a toolset

1. Fork this repository and create a branch.
2. Add a folder at the repository root named after the service. Use lowercase letters, numbers, and hyphens, for example `cal-com`.
3. Add these files to the folder:

   ```
   your-service/
   ├── toolset.yml      the manifest
   ├── README.md        setup and tools
   ├── logo.svg         optional
   └── logo-dark.svg    optional
   ```

4. [Test your tools](#test-your-tools) against the real API and [validate the manifest](#validate-the-manifest).
5. Add a row for the toolset to the table in the root [README.md](README.md).
6. Open a pull request.

## Write the manifest

The [publishing guide](https://www.chatwoot.com/captain/tools/publish) is the full reference for `toolset.yml`. The existing toolsets in this repository are good working examples. Keep these rules in mind:

- **Base everything on official docs.** Check every endpoint, method, auth setting, and parameter against the service's API documentation. Don't guess.
- **Start small.** Pick the few tools a support agent actually needs. Four focused tools are better than twenty thin wrappers around an API.
- **Prefer reads.** Add write tools only when they're clearly useful in a support conversation, and keep them narrow, for example adding a note rather than editing a record.
- **Keep credentials in `secrets`.** Use `inputs` for non-sensitive settings such as a store domain. Never commit a real key, token, or account ID.
- **Write descriptions for Captain.** Captain chooses tools and fills parameters from the `description` fields. Say when to call a tool, which tool to call first, and where an ID comes from.
- **Use `response_template`.** Turn the response into short plain text with only the fields Captain needs. Limit long lists and truncate long text. Fall back to a message such as `Stripe returned an unexpected response.` when the expected fields are missing.
- **Escape values in request bodies.** Call-time values are inserted into `request_template` as-is, so a quote in a parameter breaks the JSON. See `context-dev/toolset.yml` for a pattern that escapes quotes, backslashes, and newlines and passes the validator.

Captain's limits also shape what works:

- Only 2xx responses reach `response_template`. For any other status, Captain gets a generic error and never sees the API's message.
- Requests time out after 20 seconds, and responses over 1 MB are dropped.
- GET requests never send a body.

## Write the README

The README becomes the toolset's page in the catalog. Follow the same shape as the existing toolsets:

- **Title and one sentence** on what Captain can do with the service.
- **Setup:** where to create the credential, and the exact scopes or permissions it needs. Recommend the narrowest access that works.
- **Tools:** one bullet per tool, using its `title`, saying what it checks and any limits, such as "the 10 most recent".
- **Notes (optional):** plan requirements, API versions, and known limits.

Only document what the toolset does today. Leave out placeholder sections such as "Coming soon".

## Add a logo

Logos are optional. Add `logo.svg` or `logo.png` for light backgrounds, and `logo-dark.svg` or `logo-dark.png` if the regular logo doesn't work on dark backgrounds. WebP and AVIF also work.

- Use the service's official mark, not a full wordmark, on a square canvas.
- SVGs must be self-contained. External resources are not loaded.
- Keep files under 2 MiB and 4096 by 4096 pixels.

See the [logo guidelines](https://www.chatwoot.com/captain/tools/publish) for how logos are converted and when each variant is used.

## Test your tools

`tool-tester.rb` runs tools against the real API the way Captain does, using the same Liquid version and request rules. It needs Ruby, and installs its gems on the first run.

```sh
cp .env.example .env                        # then add your credentials
ruby tool-tester.rb your-service            # run every enabled tool
ruby tool-tester.rb your-service tool_id    # run one tool, even if it's disabled
ruby tool-tester.rb your-service --dry-run  # print requests without sending them
```

Credentials are read from `.env` as `<TOOLSET>_<SECRET>`, for example `STRIPE_API_KEY`. Add an empty entry for your toolset to `.env.example`. `.env` is ignored by git.

Test each tool with real data, including a lookup that finds nothing, and check that the rendered output reads well.

## Validate the manifest

Paste `toolset.yml` into the [manifest validator](https://www.chatwoot.com/captain/tools/validate), or send it from the command line:

```sh
curl -X POST https://www.chatwoot.com/api/captain/tools/validate \
  -H 'Content-Type: application/yaml' \
  --data-binary @your-service/toolset.yml
```

Fix every issue until the response has `"valid": true`. The validator runs the same checks as the catalog, so an invalid manifest keeps the toolset out of the catalog.

## Update an existing toolset

- **Bump `version`** in `toolset.yml` for every change: patch for fixes, minor for new tools or options, major for changes that need accounts to act, such as a new required secret.
- **Keep tool IDs stable.** Installed tools are matched to the manifest by `id` when an account updates, which keeps each tool's enabled setting. Renaming an ID adds a new tool instead of updating the old one.
- Update the README whenever tools, setup, or permissions change.

## Pull request checklist

- [ ] Every endpoint, parameter, and auth setting matches the service's official API docs.
- [ ] The manifest passes the validator.
- [ ] Every tool was run with `tool-tester.rb` against the real API.
- [ ] No credentials, account IDs, or personal data are committed.
- [ ] The README covers setup, required permissions, and every tool.
- [ ] `version` is bumped (for updates to an existing toolset).
- [ ] The root README table and `.env.example` include the toolset (for new toolsets).

In the pull request description, say which tools you added or changed and how you tested them.

## Commit messages

Use [Conventional Commits](https://www.conventionalcommits.org/), for example `feat: add Attio toolset` or `fix: correct Stripe invoice template`.
