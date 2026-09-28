Connect an OpenStatus workspace to help Captain check page status, monitors, and active incidents.

## Setup

1. Create an API key in OpenStatus under Settings > API Tokens. The key must have access to the workspace you want Captain to check.
2. Find your status page slug. It is the subdomain of your OpenStatus status page, such as `acme` for `acme.openstatus.dev`.
3. Enter the API key and status page slug when installing.

## Tools

- **Get Page Status:** Check the overall status of the configured status page and how many components are affected.
- **List Monitors:** List monitors with their IDs and current status, 20 at a time.
- **Get Monitor Status:** Check a monitor's status in each region.
- **List Active Incidents:** Find incident reports that are still investigating, identified, or monitoring.
- **Get Status Report:** Read one incident report and its updates.

For List Monitors, start with offset 0 and add 20 to read the next group.

Responses include only the fields Captain needs. Monitor request headers and other configuration are left out, so credentials for monitored services are never shown to Captain.
