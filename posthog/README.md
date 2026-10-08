Connect PostHog to help Captain look up a customer's person profile, recent events, and session recordings, and check how feature flags are rolled out.

## Setup

1. In PostHog, open **Settings → Personal API keys** and create a key. Limit it to the project Captain should read and give it only these scopes:
   - `person:read`
   - `query:read`
   - `feature_flag:read`
   - `session_recording:read`
2. Find your project ID under **Settings → Project → General**.
3. When installing, choose your PostHog region (`us.posthog.com` for US Cloud, `eu.posthog.com` for EU Cloud), and enter the project ID and the personal API key.

## Tools

- **Find Person by Email:** Find up to 3 persons by exact email address. Returns the person ID, first and last seen dates, distinct IDs, and up to 20 properties.
- **Get Person:** Read up to 80 properties stored on a person, including initial referrer and campaign properties.
- **List Person Events:** List a person's 20 most recent events from the last 30 days, with time and page URL. Can be narrowed to one event name.
- **List Person Recordings:** List a person's 10 most recent session recordings from the last 30 days, with duration, start page, clicks, and console errors.
- **List Feature Flags:** List up to 20 feature flags, optionally searching by key or description, with whether each is enabled.
- **Get Feature Flag:** Check one flag's status, variants, and up to 10 release conditions with their rollout percentages.

Start with Find Person by Email, then use the person ID with the other person tools. Use List Feature Flags to get the flag ID for Get Feature Flag.

## Notes

- Find Person by Email matches the `email` person property, so it only finds customers your app has identified with an email.
- List Person Events and List Person Recordings use PostHog's query endpoint, which is rate limited to 240 requests per minute and 2,400 per hour.
- Recordings are listed by ID. Captain cannot watch a recording; a teammate can open it in PostHog under Session replay.
- Self-hosted PostHog is not supported.
