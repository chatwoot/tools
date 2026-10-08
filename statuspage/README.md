Connect an Atlassian Statuspage page to help Captain check incidents, component status, and planned maintenance.

## Setup

1. Sign in at manage.statuspage.io, click your avatar in the bottom left, and open **API info**.
2. Copy an API key and the **Page ID** of the status page you want Captain to check.
3. Enter the API key and page ID when installing.

Statuspage API keys are not scoped: a key has the same access as the user it belongs to, including write access. Create the key from a team member account with the lowest role that can view the page. These tools only read.

## Tools

- **List Unresolved Incidents:** Check incidents that are not resolved yet, with affected components and the latest update. Shows up to 10.
- **List Components:** Check the current status of each component and how many are not operational. Shows up to 100.
- **Search Incidents:** Search current and past incidents and maintenance by keyword. Shows the 10 newest matches.
- **List Upcoming Maintenance:** Check scheduled maintenance that has not started, with its time window. Shows up to 10.
- **List Active Maintenance:** Check scheduled maintenance that is in progress now. Shows up to 10.
- **Get Incident:** Read one incident or maintenance by ID, with its 10 newest updates and its postmortem.

## Notes

- These tools use the authenticated Statuspage API at `api.statuspage.io/v1`, so they also work for private and audience-specific pages.
- Statuspage limits each API key to 1 request per second.
- Long update and postmortem text is shortened.
