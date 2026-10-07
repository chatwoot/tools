Connect a Calendly personal access token to help Captain find a customer's meetings, share reschedule and cancel links, and check open times.

## Setup

1. Create a personal access token in Calendly under Integrations & apps > API & webhooks. If Calendly asks for scopes, select `scheduled_events:read`, `event_types:read`, and `availability:read`. Add `users:read` for step 2. Create the token as an organization owner or admin, because Calendly only lets owners and admins look up meetings across the organization.
2. Find your organization ID. Request `https://api.calendly.com/users/me` with the token as a Bearer token, and copy the last part of `current_organization`. For `https://api.calendly.com/organizations/AAAAAAAAAAAAAAAA`, the ID is `AAAAAAAAAAAAAAAA`.
3. Enter the token and organization ID when installing.

## Tools

- **Find Events by Email:** Find a customer's 10 most recent meetings using their email address, with time, status, hosts, location or join link, and cancellation reason. Returns the event ID the next two tools need.
- **Get Event:** Read one meeting by event ID, including when it was booked, hosts, guests, and invitee counts.
- **List Event Invitees:** List up to 10 invitees of a meeting with their status, time zone, answers to booking questions, payment, and personal reschedule and cancel links.
- **List Event Types:** List up to 20 active event types with duration and public booking link. Secret event types are left out.
- **List Available Times:** Check open times for an event type within a date range, up to 20 at a time, each with a link that books that time.

Start with Find Events by Email for existing meetings. For new bookings, use List Event Types, then List Available Times.

## Notes

- All times are shown in UTC.
- Calendly only returns available times for a range that starts in the future and spans at most 31 days.
- Captain does not cancel or reschedule meetings itself. It shares the invitee's own Calendly links instead.
