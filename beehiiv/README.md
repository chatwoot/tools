Connect beehiiv to help Captain look up newsletter subscribers, check their subscription status and tier, find recent posts, and tag subscribers for follow-up.

## Setup

1. In beehiiv, open **Settings**, then **API** under **Workspace Settings**. You need to be a workspace Owner or Admin.
2. Click **Create New API Key**, name it, and copy the key. beehiiv shows it only once. You can restrict the key to the publication you want Captain to use.
3. On the same page, copy the **Publication ID** of that publication. It starts with `pub_`.
4. Enter the API key and publication ID when installing.

## Tools

- **Find Subscriber by Email:** Find a subscriber by exact email address. Returns the subscription ID, status, free or premium tier, signup date and source, engagement stats, and custom fields.
- **Get Subscription:** Check one subscription in full, including premium tiers, tags, up to 25 custom fields, engagement stats, and how many people the subscriber referred.
- **List Recent Posts:** Check the 10 most recent published or scheduled posts, with publish date, audience, email subject, and web link.
- **List Tiers:** Check up to 20 paid tiers with their enabled prices and billing intervals.
- **Add Subscription Tag:** Add one tag to a subscription, such as a follow-up flag. The tag is created if it does not exist.

Start with Find Subscriber by Email, then use the subscription ID with Get Subscription or Add Subscription Tag.

## Notes

- All tools work on the one publication set at install. Install again with another publication ID to cover a second newsletter.
- beehiiv may require account verification and a plan with API access before API keys can be created.
- Tags can trigger automations or segments you have set up in beehiiv. Disable Add Subscription Tag if you don't want Captain to change subscribers.
- Drafts and archived posts are left out of List Recent Posts.
