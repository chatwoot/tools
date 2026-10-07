Connect ActiveCampaign to help Captain look up contacts, check their list subscriptions, activity, and bounces, add notes, and unsubscribe them on request.

## Setup

1. In ActiveCampaign, open **Settings → Developer**. Copy the **API URL** and **API key**. Each user has their own key, and it carries that user's permissions, so use a user with access to the contacts and lists Captain should see.
2. When installing, enter the API URL host without `https://`, such as `youraccountname.api-us1.com`, and the API key.

## Tools

- **Find Contact:** Find a contact by exact email address. Returns the contact ID and hard and soft bounce counts.
- **List Contact Lists:** Check which lists a contact is on, their status on each, and when and why they unsubscribed or bounced. Shows up to 30 lists.
- **List Lists:** List the account's email lists with IDs, names, and active subscriber counts, up to 100.
- **List Contact Activity:** Check a contact's 20 most recent events, such as campaign emails sent, link clicks, replies, list changes, and automations entered.
- **List Contact Bounces:** Check the 10 most recent bounces recorded for a contact.
- **List Contact Notes:** Read the 5 most recent notes on a contact.
- **Add Note:** Add a plain-text note to a contact, such as a conversation summary or a follow-up request.
- **Unsubscribe from List:** Unsubscribe a contact from one list.

Start with Find Contact, then use the contact ID with the other tools.

## Notes

- The activity feed does not include email opens, and it shows record IDs rather than campaign names.
- List subscriptions are per list, so Unsubscribe from List has to be run once for each list.
- Tags and custom field values are not included yet.
