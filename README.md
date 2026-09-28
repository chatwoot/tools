# Captain Tools

Toolsets that let [Captain](https://www.chatwoot.com/captain), Chatwoot's AI agent, look things up in the services your team already uses, such as payments, bookings, CRMs, and status pages.

Every toolset in the [Captain tools catalog](https://www.chatwoot.com/captain/tools) lives in this repository. Each one is a folder with a `toolset.yml` manifest and a README that covers setup and the available tools. A manifest only describes HTTP requests. It contains no code, and credentials are entered by each account when they install it.

## Toolsets

| Toolset | Category | What Captain can do |
| --- | --- | --- |
| [Attio](attio) | CRM | Look up people, companies, deals, and notes, and add notes to records. |
| [Better Stack](better-stack) | Engineering & status | View monitors and uptime incidents. |
| [Cal.com](cal-com) | Scheduling | Find bookings and available times. |
| [Context.dev](context-dev) | Business data & research | Search the web, research questions, and look up people. |
| [OpenStatus.dev](openstatus-dev) | Engineering & status | Check status page status, monitors, and active incidents. |
| [Stripe](stripe) | Payments & billing | Check customer payments, invoices, and subscriptions. |

## Using a toolset

Install toolsets from the Captain tools page in Chatwoot. Each toolset's README lists the credentials and permissions it needs.

## Adding or updating a toolset

Open a pull request against this repository. The Chatwoot team reviews every change before it reaches the catalog. [CONTRIBUTING.md](CONTRIBUTING.md) covers the folder layout, manifest rules, testing, and what reviewers look for.

- [Publishing guide](https://www.chatwoot.com/captain/tools/publish): the full manifest reference.
- [Manifest validator](https://www.chatwoot.com/captain/tools/validate): check a `toolset.yml` in the browser or from the command line.

To report a broken tool or request a new integration, [open an issue](https://github.com/chatwoot/tools/issues).
