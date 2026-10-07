Connect PagerDuty to help Captain check open and recent incidents, responder notes, and service status.

## Setup

1. In PagerDuty, go to **Integrations > Developer Tools > API Access Keys**. Only admins and the account owner can create these keys.
2. Click **Create New API Key**, add a description, and check **Read-only API Key** so the key can only make GET requests.
3. Enter the key when installing.

## Tools

- **List Open Incidents:** Check triggered and acknowledged incidents, newest first. Shows up to 20.
- **List Recent Incidents:** Check incidents from the past month in any status, including resolved ones. Shows up to 20.
- **Get Incident:** Check one incident's status, priority, service, timing, and assignees by ID.
- **List Incident Notes:** Read the 10 newest notes responders added to an incident.
- **List Services:** Find services by name and check their current state. Shows up to 25.

## Notes

- These tools use the PagerDuty REST API v2 at `api.pagerduty.com` and send the key as `Authorization: Token token=<key>`.
- A general access key can see every incident and service in the account. Incident titles and notes are internal, so review how Captain is instructed to share them with customers.
- Priority is shown only when incident priorities are enabled on the account.
