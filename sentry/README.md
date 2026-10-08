Connect Sentry to help Captain check whether an error a customer reports is a known issue, and look up errors by issue ID or event ID.

## Setup

1. In Sentry, go to **Settings > Developer Settings** and create an internal integration.
2. Under permissions, give it **Issue & Event: Read** and **Organization: Read**. No other access is needed.
3. Save the integration and copy its token.
4. Find your organization slug. It is the name in your Sentry URL, such as `acme` in `acme.sentry.io`.
5. Enter the token, the organization slug, and your data storage location when installing. Choose `us` unless your organization stores data in the EU (`de`).

## Tools

- **Search Issues:** Search issues with Sentry search syntax or a short ID. Shows the 10 most recently seen matches.
- **Get Issue:** Check one issue's status, event and user counts, first and last seen times, and releases.
- **Find Issue by Short ID:** Look up an issue by its short ID, such as `WEB-1A2`.
- **Find Issue by Event ID:** Find the issue behind an event ID a customer shares from an error screen.
- **List Issue Events:** List 5 events for an issue with their environment, release, browser, and operating system.

## Notes

- These tools call `https://<region>.sentry.io/api/0` for Sentry's cloud service. Self-hosted Sentry is not supported.
- Find Issue by Event ID needs the `org:read` scope. The other tools need `event:read`.
- Stack traces and user details are left out of the responses.
