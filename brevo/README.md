Connect Brevo to help Captain look up contacts, check their lists and email activity, add notes, and unsubscribe them on request.

## Setup

Create an API key in Brevo under **SMTP & API → API keys**, then enter it when installing. Brevo API keys are not scoped, so create a separate key for Captain that you can delete on its own.

## Tools

- **Get Contact:** Look up a contact by email address. Returns the contact ID, email and SMS blocklist status, list IDs, and attributes (up to 25).
- **Get Campaign Activity:** Check a contact's email campaign activity in the last 90 days, with counts and the most recent sends, opens, bounces, complaints, and unsubscribes.
- **List Lists:** List the account's contact lists with IDs, names, and contact counts, 50 at a time.
- **List Transactional Emails:** List the 10 most recent transactional emails sent to an email address.
- **List Email Events:** List the 20 most recent transactional email events for an email address in the last 30 days, with bounce reasons.
- **Add Note:** Add a plain-text note to a contact, such as a conversation summary or a follow-up request.
- **Remove Contact from List:** Remove a contact from one list.
- **Unsubscribe Contact:** Blocklist a contact from all email campaigns.

Start with Get Contact, then use the contact ID, email address, and list IDs it returns with the other tools.

## Notes

- Brevo returns an error for an email address that is not a contact, so Captain sees a generic failure from Get Contact and Get Campaign Activity when the contact does not exist.
- Campaign activity shows campaign IDs, not campaign names.
- Add Note creates a Brevo CRM note linked to the contact.
