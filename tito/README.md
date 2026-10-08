Connect a Tito API token to help Captain look up events, find a customer's registration or ticket, and answer questions about ticket types.

## Setup

1. Sign in at [id.tito.io](https://id.tito.io) and generate a new API token. Choose the secret token type and live mode, so the tools see real registrations and tickets.
2. Find your account slug. It is the first part of your event URLs, such as `acme-events` in `ti.to/acme-events/my-conference`.
3. Enter the API token and account slug when installing.

A Tito API token has the same access as the user who created it; Tito does not offer read-only tokens. These tools only read data.

## Tools

- **List Upcoming Events:** List up to 30 upcoming events with dates, location, status, and the event slug the other tools need.
- **List Past Events:** List up to 30 past events with dates and event slug.
- **Get Event:** Get one event's dates, time zone, location, currency, contact email, and the first 500 characters of its description.
- **Find Registrations:** Search one event's registrations (orders) by buyer email, name, or order reference. Returns up to 10 matches, including cancelled ones, with state, ticket counts, and total.
- **Get Registration:** Get one registration's state, totals, discount code, refund status, and up to 20 tickets.
- **Find Tickets:** Search one event's tickets by ticket holder email, name, or ticket reference. Returns up to 10 matches, including void tickets, with the ticket type, state, and the order it belongs to.
- **List Ticket Types:** List up to 30 releases for an event with price, sale status, sale dates, and a buy link for releases that are not secret.

Start with List Upcoming Events to get the event slug. Use Find Registrations for the person who bought, and Find Tickets for someone who was assigned a ticket.

## Notes

- These tools use version 3.0 of the Tito Admin API.
- Tito searches registrations and tickets one event at a time, so Captain needs to know which event the customer means.
- A token in test mode only returns test registrations and tickets.
- Prices and totals are in the event's currency, which Get Event shows.
- Captain cannot refund, cancel, void, or reassign tickets.
