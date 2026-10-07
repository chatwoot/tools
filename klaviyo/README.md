Connect Klaviyo to help Captain look up a customer's profile, marketing consent, recent activity, and list and segment membership.

## Setup

Create a private API key in Klaviyo under Settings > API keys. Choose custom access and grant read-only access to Profiles, Events, Metrics, Lists, and Segments. Enter the key when installing.

## Tools

- **Find Profile by Email:** Find a profile by email address, with phone, location, and email and SMS marketing consent, including suppression reasons such as a hard bounce or unsubscribe. Returns the profile ID the other tools need.
- **Find Profile by Phone:** Find a profile by phone number in international format, with the same details.
- **Get Profile:** Read a profile's details, order statistics such as number of orders and lifetime value, and up to 20 custom properties.
- **List Profile Events:** List a profile's 20 most recent events, such as emails received and opened or orders placed, with email subject and order value when Klaviyo records them.
- **List Profile Lists and Segments:** List up to 25 lists and 25 segments the profile belongs to.

Start with Find Profile by Email or Find Profile by Phone, then use the profile ID with the other tools.

## Notes

- These tools set `revision: 2026-07-15` for all requests, so responses keep the same shape when Klaviyo releases a new API revision.
- Order statistics come from Klaviyo's predictive analytics and are only filled in for accounts that have them.
- Klaviyo limits list and segment lookups for a profile to 1 request per second and 15 per minute.
- These tools only read data. Captain cannot subscribe, unsubscribe, or edit profiles.
