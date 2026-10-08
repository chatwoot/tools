Connect Rootly to help Captain check active and recent incidents, their timelines, and the status page updates published for them.

## Setup

Create an API key in Rootly under Organization dropdown > Organization Settings > API Keys. Enter the key when installing. These tools only read incidents, so read access is enough.

## Tools

- **List Active Incidents:** Find incidents that are still open among the 25 most recently created, with severity and affected services.
- **List Recent Incidents:** List the 10 most recently created incidents, including resolved ones.
- **List Incidents by Status:** List the 10 most recently created incidents in one status, such as started, mitigated, or resolved.
- **Search Incidents:** Search incidents by keyword and get the 10 most recently created matches.
- **Get Incident:** Read one incident's status, severity, summary, affected services, and mitigation or resolution message.
- **List Incident Timeline:** Read up to 20 timeline events of an incident, each marked internal or external.
- **List Incident Status Updates:** Read up to 10 status page updates published for an incident.

Start with List Active Incidents or Search Incidents, then use the incident ID with the other tools.

## Notes

- List Active Incidents treats an incident as open unless its status is resolved, closed, cancelled, completed, or scheduled. It only looks at the 25 most recently created incidents; use List Incidents by Status to find older open ones.
- Private incidents the API key can access are included and labeled as private so Captain does not share their details.
- Rootly rate limits API requests per key. Contact Rootly to raise the limit if Captain is rate limited.
