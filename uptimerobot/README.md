Connect UptimeRobot to help Captain check which monitors are down and look up downtime incidents.

## Setup

1. In UptimeRobot, open the Integrations page and go to the API section.
2. Create a read-only API key. These tools only read, so the account-specific API key is not needed.
3. Enter the key when installing.

## Tools

- **List Down Monitors:** List up to 50 monitors that are down or look down, with the reason from their last incident.
- **Search Monitors:** Find up to 20 monitors by part of their name and see their current status.
- **Get Monitor:** Check one monitor's status, check type, target, check interval, tags, and last incident.
- **List Open Incidents:** List up to 20 incidents that are ongoing, with the affected monitor and the reason.
- **List Recent Incidents:** List up to 20 incidents that started after a given date, including resolved ones.
- **List Monitor Incidents:** List up to 20 incidents for one monitor.
- **Get Incident:** Read one incident's status, reason, start and resolve times, and the checked URL and HTTP response code when available.

Start with List Down Monitors or List Open Incidents, then use the IDs they return with the other tools.

## Notes

- These tools use the UptimeRobot v3 API, which sends the API key as a Bearer token.
- Monitor credentials, custom HTTP headers, and heartbeat URLs are never shown to Captain.
- The free plan allows 10 API requests per minute.
