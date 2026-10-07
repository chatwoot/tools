Connect Freshsales to help Captain look up contacts, accounts, and deals in your CRM, see recent activity, and log notes on contacts.

## Setup

1. In Freshsales, click your profile picture and open **Profile Settings > API Settings**.
2. Copy **Your API key** and the **Bundle alias** shown below it, such as `acme.myfreshworks.com/crm/sales`.
3. Enter both when installing. Enter the bundle alias without `https://` and without a trailing slash.

The API key acts as the user it belongs to, so Captain sees the records that user can see. Use a user whose role can view the contacts, accounts, and deals Captain should read.

## Tools

- **Find Contact by Email:** Find contacts by their exact email address. Returns the contact ID the other tools need.
- **Get Contact:** Check a contact's details, including phone numbers, lead score, owner, custom fields, and the accounts they belong to.
- **List Contact Deals:** Check up to 10 deals linked to a contact, with amount and expected close date.
- **Get Deal:** Check one deal's amount, stage, close date, owner, and custom fields.
- **Get Account:** Check an account's website, phone, size, open deals, owner, and custom fields.
- **List Contact Activities:** Read the 10 most recent timeline activities for a contact, such as deal stage changes and meetings.
- **Add Note:** Add a plain-text note to a contact, such as a conversation summary or a follow-up request.

Start with Find Contact by Email, then use the contact ID with the other tools.

## Notes

- Find Contact by Email only returns exact matches. A partial email address finds nothing.
- Custom fields are shown under their internal names, such as `cf_plan` shown as "plan".
- Freshsales sends the API key in the `Authorization` header as `Token token=<key>`, so the tools set that header directly.
