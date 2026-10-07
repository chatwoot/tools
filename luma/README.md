Connect a Luma API key to help Captain look up events, check a guest's registration, and answer questions about tickets.

## Setup

1. Open [luma.com/calendar/manage/api-keys](https://luma.com/calendar/manage/api-keys), select the calendar that hosts your events, and generate an API key.
2. Enter the API key when installing.

A Luma API key is scoped to one calendar and grants full access to it; Luma does not offer read-only keys. These tools only read data.

## Tools

- **List Events:** List up to 20 events the calendar manages that start on or after a date, soonest first, with time, location, registration status, and event page link.
- **Find Event by URL:** Find an event's ID from its Luma page URL or slug.
- **Get Event:** Get one event's time, location or meeting link, visibility, registration status, capacity, spots left, starting price, hosts, guest counts, and the first 500 characters of its description.
- **Get Guest:** Check a customer's registration for one event by email address, including approval status, up to 10 tickets, check-in, and amounts charged or refunded.
- **List Ticket Types:** List up to 30 visible ticket types for an event with price, capacity, and whether host approval is required.
- **Find Contact:** Search the calendar's contacts by email or name, returning up to 10 matches with how many events they were approved for and checked in to, membership status, and tags.

Start with List Events or Find Event by URL to get an event ID, then use Get Guest with the customer's email address.

## Notes

- The Luma API requires a Luma Plus subscription.
- Luma looks up guests one event at a time, so Captain needs to know which event the customer means. Luma's docs don't describe the response when an email is not on the guest list; if Luma answers with an error status, Captain sees a generic failure rather than a "not found" message.
- Prices and payment amounts are in the currency's smallest unit, such as cents.
- Event times are in UTC, shown alongside the event's own time zone.
- Captain cannot approve, decline, refund, or check in guests.
