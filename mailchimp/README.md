Connect Mailchimp to help Captain look up contacts, check their subscription status, tags, and email activity, add notes, and unsubscribe them on request.

## Setup

1. Create an API key in the **API keys** section of your Mailchimp account by clicking **Create New Key**. Mailchimp API keys give full access to the account and belong to the user who creates them, so create one only for Captain.
2. Find your data center. It is the part after the dash in the API key, such as `us21`.
3. Enter the API key and data center when installing.

## Tools

- **Find Member:** Find a contact by email address across every audience. Returns the audience ID, member ID, subscription status, tags, rating, merge fields, and last note for each audience they are in, up to 10.
- **List Audiences:** List the account's audiences with IDs, names, and subscriber counts, up to 50.
- **List Member Activity:** Check a contact's 15 most recent email events in one audience, such as sends, opens, clicks, bounces, and unsubscribes.
- **List Member Notes:** Read the 5 most recent notes on a contact in one audience.
- **Add Member Note:** Add a plain-text note of up to 1,000 characters to a contact in one audience.
- **Unsubscribe Member:** Unsubscribe a contact from one audience.

Start with Find Member, then use the audience ID and member ID with the other tools.

## Notes

- These tools use the Mailchimp Marketing API. Transactional email sent through Mailchimp Transactional (Mandrill) is not covered.
- A contact has a separate status in each audience, so Unsubscribe Member has to be run once per audience.
