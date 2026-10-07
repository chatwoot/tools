Connect Loops to help Captain look up contacts, check their subscription and suppression status, and unsubscribe them on request.

## Setup

Create an API key in Loops under **Settings → API** by clicking **Generate key**. Enter the key when installing. Loops API keys are not scoped, so create a separate key for Captain that you can revoke on its own.

## Tools

- **Find Contact:** Find a contact by email address. Returns whether they are subscribed, the IDs of their mailing lists, their user group, and custom properties (up to 20).
- **Get Suppression Status:** Check whether Loops suppressed a contact after a hard bounce or spam complaint.
- **List Mailing Lists:** List the account's mailing lists with their IDs and names, up to 50.
- **List Transactional Emails:** List the 20 most recently created transactional emails and whether each one is published.
- **Unsubscribe Contact:** Unsubscribe a contact from all campaign and workflow emails.
- **Remove from Mailing List:** Remove a contact from one mailing list while keeping their other subscriptions.

Start with Find Contact, then use the email address and mailing list IDs it returns with the other tools.

## Notes

- Loops does not expose a contact's sent-email history through its API, so Captain cannot see which emails a contact received.
- The two write tools use Loops' update-contact endpoint, which creates a contact if the email address does not exist. Captain is told to call Find Contact first.
- Get Suppression Status only works for an existing contact. Removing a suppression is not included; do that in Loops.
- List Transactional Emails needs the content API to be enabled for your Loops team.
