# Cal.com

Connect a Cal.com API key to help Captain find bookings and open appointment times.

## Setup

Create an API key in Cal.com and enter it when installing this toolset. The key must have access to the bookings and event types you want Captain to use.

## Tools

- **Find Bookings by Email:** Find bookings using a customer's email address.
- **Get Booking:** Check a booking's status, time, and details by UID.
- **List Event Types:** List appointment types for the connected account.
- **Get Available Slots:** Check open times for an event type and date range.

This toolset sets `cal-api-version: 2026-05-01` for all requests. That is the version Cal.com requires for booking search. Cal.com documents different versions for the other endpoints, so those may still return an older response until Captain supports headers for individual tools.
