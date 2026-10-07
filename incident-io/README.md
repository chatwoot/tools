Connect incident.io to help Captain check active and recent incidents, their updates, and what is published on your status page.

## Setup

1. In incident.io, go to **Settings > API keys** and create a key.
2. Give it the **View data** permission only. This gives read-only access to public incidents. Leave out **View all incident data** unless Captain should also see private incidents.
3. Copy the key, which is shown only once, and enter it when installing.

## Tools

- **List Active Incidents:** Check incidents in an active status, newest first. Shows up to 20.
- **List Recent Incidents:** Check the 20 most recently created incidents in any status.
- **Get Incident:** Check one incident's status, severity, summary, and role assignments by ID or reference number.
- **List Incident Updates:** Read the 10 newest updates on an incident.
- **List Status Pages:** List status pages with their IDs and public URLs.
- **List Status Page Incidents:** Check the 10 incidents returned for a status page, with the public status and latest public update.

## Notes

- Incident names, summaries, and updates are internal. Use List Status Page Incidents when Captain needs wording that is already public.
- Test and tutorial incidents are left out, which is the API's default.
- The status page tools only return data if you use incident.io status pages.
