Connect Eventbrite to help Captain look up a customer's ticket orders and answer questions about your events and ticket types.

## Setup

1. Sign in to Eventbrite and copy your private token from the [API keys page](https://www.eventbrite.com/platform/api-keys).
2. Find your organization ID. It is not the organizer ID in your organizer profile URL. Request it from the API with your token and copy the `id` of the organization that owns your events:

   ```sh
   curl -H 'Authorization: Bearer YOUR_PRIVATE_TOKEN' https://www.eventbriteapi.com/v3/users/me/organizations/
   ```

3. Enter the private token and organization ID when installing.

The private token has the same access as your Eventbrite user, and Eventbrite does not offer narrower scopes. Use the token of a user whose role in the organization can view orders and attendees. These tools only read data.

## Tools

- **Find Orders by Email:** Find up to 10 orders placed with an email address across all of the organization's events, with status, total, and event.
- **Get Order:** Get one order with its event, total, and up to 20 tickets, including each ticket holder's ticket type and check-in, cancellation, and refund status.
- **List Upcoming Events:** List up to 20 live or in-progress events, soonest first, with date, venue, ticket availability, and event page link.
- **Get Event:** Get one event's status, times, venue and address, capacity, price range, and whether tickets are available.
- **List Ticket Types:** List up to 30 ticket types for an event with price, fee, sale status, and sales dates.

Start with Find Orders by Email for questions about a purchase, then use the order ID with Get Order.

## Notes

- Find Orders by Email matches the email of the person who placed the order. A ticket holder who did not buy the ticket themselves is listed on the buyer's order, which Get Order shows.
- Event start and end times are in the event's own time zone. Order and ticket sales times are in UTC.
- Captain cannot refund, cancel, or transfer tickets.
