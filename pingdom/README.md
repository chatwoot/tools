Connect Pingdom to help Captain check which uptime checks are down, recent outages, and planned maintenance.

## Setup

Create a Pingdom API token in My Pingdom and set its access level to Read access. Enter the token when installing.

## Tools

- **List Down Checks:** Find uptime checks that are down or unconfirmed down right now. Examines up to 500 checks and shows up to 20 that are down.
- **List Checks:** List uptime checks with their status and check ID, 50 at a time.
- **Get Check:** Check one uptime check's status, last test, and last downtime.
- **List Check Outages:** List a check's downtime periods over the last 7 days, up to the 15 most recent.
- **Get Check Uptime:** Get a check's uptime percentage, total downtime, and average response time since a start date.
- **List Check Results:** Read 10 recent test results from the last 24 hours, with the error reported by each failed test.
- **List Maintenance Windows:** List the 10 most recently scheduled maintenance windows.

Start with List Down Checks or List Checks, then use the check ID with the other tools. For List Checks, start with offset 0 and add 50 to read the next group.

## Notes

- These tools use Pingdom API 3.1 and cover uptime checks. Transaction checks are not included.
- Responses include only the fields Captain needs. Check settings such as request headers, POST data, and HTTP authentication are left out, so credentials for monitored services are never shown to Captain.
- Times are shown in the time zone of the Chatwoot server, with the zone abbreviation next to each time.
