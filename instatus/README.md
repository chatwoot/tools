Connect Instatus to help Captain check your status page, component health, incidents, and maintenances.

## Setup

1. In Instatus, open User settings > Developer settings and copy your API key.
2. Find your status page ID. In the dashboard, right-click your project in the top-left corner and click Copy Project ID.
3. Enter the API key and status page ID when installing.

Instatus API keys are not scoped, so the key can read and change every page the user can access. These tools only read.

## Tools

- **List Status Pages:** Check the overall status of each status page the API key can access, up to 25.
- **List Components:** List up to 100 components of the configured page with their current status, and how many are not operational.
- **List Active Incidents:** List up to 20 incidents that are investigating, identified, or monitoring, with affected components and the latest update.
- **List Incidents:** List incidents, including resolved ones, 20 per page.
- **Get Incident:** Read one incident with its affected components and up to 15 updates.
- **List Maintenances:** List up to 15 maintenances that are not started yet or in progress.
- **Get Maintenance:** Read one maintenance with its affected components and up to 15 updates.

For List Incidents, start with page 1.

## Notes

- All tools except List Status Pages use the status page ID entered at install.
- List Maintenances reads the first 50 maintenances on the page and leaves out completed ones.
