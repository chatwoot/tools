Connect Customer.io to help Captain look up people, their attributes, segments, and subscription preferences, and check the messages sent to them.

## Setup

1. Create an App API key in Customer.io in your account settings under **API Credentials → App API Keys**. This is not the Track API key or site ID.
2. When installing, enter the key and choose the API host for your account region: `api.customer.io` for US accounts or `api-eu.customer.io` for EU accounts.

## Tools

- **Find Customer:** Find people by email address. Returns the Customer.io ID (`cio_id`) the other tools need.
- **Get Customer Attributes:** Check a person's profile, including whether they are globally unsubscribed, when they were last emailed, and up to 30 attributes.
- **List Customer Segments:** List the segments a person belongs to, up to 40.
- **List Customer Messages:** List the 10 most recent messages created for a person in the last 6 months, with delivery metrics and failure reasons.
- **List Customer Activities:** List a person's 20 most recent activities, such as emails sent, opened, or bounced, events, and attribute changes.
- **Get Subscription Preferences:** Check which subscription topics a person is subscribed to, up to 30.
- **Check Email Suppression:** Check whether an email address is suppressed by the email provider because of a bounce or spam complaint.

Start with Find Customer, then use the `cio_id` with the other tools.

## Notes

- All tools are read-only. Changing a person's subscription needs Customer.io's Track API, which uses different credentials and is not included.
- Customer.io only guarantees activity history for the last 30 days.
- The App API is limited to 10 requests per second.
