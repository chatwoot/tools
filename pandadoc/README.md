Connect PandaDoc to help Captain find a customer's quotes, proposals, and contracts and check their status, recipients, and signing progress.

## Setup

1. In PandaDoc, open the **Dev Center** and generate an API key on the **Configuration** page of the Developer Dashboard. Use a production key; PandaDoc approves production keys through its sales team.
2. Generate the key as a user who can see the documents and contacts Captain should find. The key has that user's access, and it stops working if the user is removed from the workspace.
3. Enter the key when installing.

## Tools

- **Find Contact by Email:** Find up to 5 contacts by exact email address. Returns the contact ID that List Documents for Contact needs.
- **List Documents for Contact:** Check the 10 most recently created documents where the contact is a recipient or approver, with status and created, completed, and expiration dates.
- **Search Documents:** Find the 10 most recently created documents matching a document name or reference number.
- **Get Document Status:** Check one document's current status and dates.
- **Get Document Details:** Check one document's status, sent and completion dates, total, template, sender, tags, and up to 15 recipients with their role and whether each has completed the document.

Start with Find Contact by Email, then List Documents for Contact, then Get Document Details for the document the customer asks about.

## Notes

- All tools are read-only. Captain cannot send, change, or void documents, or send reminders.
- Signing links, document content, and field values are left out of what Captain sees.
- PandaDoc describes API-key authentication as a legacy method and recommends OAuth 2.0 for new integrations. API keys still work and are what this integration uses.
- API keys and the public API depend on your PandaDoc plan. A sandbox key only sees sandbox documents.
- A person who received a document without being saved as a contact is not found by Find Contact by Email. Use Search Documents with the document name instead.
