Connect Kit (formerly ConvertKit) to help Captain check whether someone is subscribed, see their tags and email engagement, and tag a subscriber on request.

## Setup

1. In Kit, open **Settings → Developer** and add a new **V4 API key**. Copy it when it is shown; Kit does not display it again.
2. Enter the API key when installing.

Kit API keys are not scoped, so the key can reach everything in the account that the V4 API exposes. V3 API keys and secrets do not work with these tools.

## Tools

- **Find Subscriber by Email:** Find a subscriber by exact email address in any state, including unsubscribed, bounced, and complained. Returns the subscriber ID, state, sign-up date, location, tag names, and up to 15 custom fields.
- **List Subscriber Tags:** List up to 50 tags on a subscriber, with tag IDs and the date each was applied.
- **Get Subscriber Email Stats:** Check how many emails a subscriber was sent, opened, clicked, and bounced, and when they were last sent an email.
- **List Tags:** List up to 100 tags in the account with their IDs.
- **List Forms:** List up to 50 active forms and landing pages with their public links.
- **List Sequences:** List up to 50 email sequences, whether each is active, and its sending schedule.
- **Tag Subscriber:** Add a tag to an existing subscriber. This is the only tool that changes data.

Start with Find Subscriber by Email, then use the subscriber ID with the other tools.

## Notes

- These tools use Kit API V4. API keys are limited to 120 requests per rolling 60 seconds.
- Tags can trigger automations in Kit. Disable Tag Subscriber if Captain should stay read-only.
- Kit reports an unsubscribed subscriber's state as `cancelled`.
