Connect a SavvyCal personal access token to help Captain look up bookings, list scheduling links, and check open times.

## Setup

1. In SavvyCal, open Settings > Developers and click "Create a token" under Personal Access Tokens. Give it a name that says it is for Chatwoot.
2. Copy the private key, which starts with `pt_secret_`, and enter it when installing.

The token acts as the SavvyCal user who created it and can see every booking and link that user can access, including their teams'. These tools only read data.

## Tools

- **List Upcoming Bookings:** List the next 50 upcoming bookings in any state, with time, state, and each attendee's name and email.
- **List Bookings by Date:** List up to 50 bookings that start within a date range, past or future, with the same details.
- **Get Booking:** Get one booking's details, including attendees and their time zones, location or video link, payment, cancellation or reschedule reason, and the booking page link.
- **List Scheduling Links:** List up to 50 active scheduling links with their durations and link IDs.
- **Get Available Slots:** Check open times on a scheduling link within a date range, for each meeting length the link offers.

## Notes

- The SavvyCal API cannot filter bookings by attendee email. Captain lists bookings and matches the customer's email in the results, so busy accounts should use List Bookings by Date with a short range.
- Booking and slot times are in UTC. Captain converts them to the customer's time zone.
- Get Available Slots checks the first 300 slots SavvyCal returns. SavvyCal allows a range of up to 31 days, but 7 days or less keeps the list complete.
- Captain cannot book, reschedule, or cancel meetings. It shares the booking page link instead.
