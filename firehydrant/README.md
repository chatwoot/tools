Connect FireHydrant to help Captain check active and recent incidents, their milestones and notes, and which services are impacted.

## Setup

Create an API key in FireHydrant under Settings > API Keys. You need Owner permissions to create one. Enter the key when installing.

## Tools

- **List Active Incidents:** Find incidents that are still active among the 20 most recent, with severity, services, and customer impact.
- **List Recent Incidents:** List 10 recent incidents, including resolved ones.
- **Search Incidents:** Search incidents by keyword in their name, summary, and description, up to 10 matches.
- **Get Incident:** Read one incident's current milestone, severity, summary, customer impact, impacted services, and latest update.
- **List Incident Milestones:** Read when an incident reached each milestone, such as started, mitigated, and resolved.
- **List Incident Notes:** Read up to 20 notes posted on an incident's timeline, each marked with its visibility.
- **Find Services:** Search the service catalog by name or description and see which services have active incidents, up to 10 matches.

Start with List Active Incidents, Search Incidents, or Find Services, then use the incident ID with the other tools.

## Notes

- FireHydrant API keys have Owner permissions by default. These tools only read data.
- List Active Incidents only looks at the 20 most recent incidents. Use Find Services to check a specific service for active incidents.
- List Incident Notes returns timeline events of the `note` type. Other timeline events, such as chat messages and role changes, are left out.
