# Cal.com

Connect a Cal.com API key to help Captain find a customer's bookings and open appointment times.

## Setup

1. Create an API key in Cal.com under Settings > Developer > API Keys. The key must have access to the bookings you want Captain to find.
2. Find the ID of the event type customers book. Open the event type in Cal.com; the number at the end of its URL is the ID.
3. Enter the API key and event type ID when installing this toolset.

## Tools

- **Find Bookings by Email:** Find a customer's 10 most recent bookings using their email address. Each result includes the time, status, hosts, and location, plus reschedule and cancel links for active bookings.
- **Get Available Slots:** Check open times for the configured event type within a date range, in the customer's time zone.

This toolset sets `cal-api-version: 2024-08-13` for all requests. That version supports booking search by email and the `/v2/slots/available` endpoint, which lets both tools share one API version.
