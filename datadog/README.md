Connect Datadog to help Captain check which monitors are alerting, look up incidents, and see active downtimes.

## Setup

1. In Datadog, go to Organization Settings > Service Accounts and open (or create) a service account for Captain.
2. Under Access Tokens, click New Token and select only these scopes: `monitors_read`, `incident_read`, and `monitors_downtime`.
3. Copy the token. Datadog shows it only once.
4. When installing, enter the token and pick your Datadog site. The site matches the domain you use to sign in, such as `datadoghq.com` for US1 or `datadoghq.eu` for EU.

A personal access token with the same scopes also works, but it is tied to one user and expires within a year.

## Tools

- **List Triggered Monitors:** List up to 20 monitors that are in Alert, Warn, or No Data.
- **Search Monitors:** Find up to 20 monitors by name, service, tag, or status, using Datadog's monitor search syntax.
- **Get Monitor:** Check one monitor's overall state, query, notification message, and up to 10 groups that are not OK.
- **List Active Incidents:** List the 10 newest incidents that are active or stable.
- **Search Incidents:** Search incidents, including resolved ones, by state or severity. Returns the 10 newest matches.
- **Get Incident:** Read one incident's state, severity, customer impact, timeline, and custom fields such as summary and root cause.
- **List Active Downtimes:** List up to 20 downtimes that are active right now, with their scope and schedule.

Start with List Triggered Monitors or List Active Incidents, then use the IDs they return with Get Monitor or Get Incident.

## Notes

- These tools authenticate with a service access token or personal access token sent as a Bearer token. Datadog API keys and application keys are not supported.
- The incident tools need Datadog Incident Management. Datadog marks the incident list and details endpoints as public beta.
- Get Incident takes the incident's UUID from the list tools, not the short incident number shown in Datadog.
- Monitor notification messages can include internal notes and @-handles. Captain sees the first 400 characters.
