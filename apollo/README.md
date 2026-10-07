Connect Apollo.io to help Captain look up the contacts, accounts, deals, and notes saved in your Apollo account.

## Setup

1. In Apollo, open **Settings > Integrations > API Keys** and click **Create new key**.
2. Select the endpoints the key can call. These tools need:
   - `api/v1/contacts/search` and `api/v1/contacts/show`
   - `api/v1/accounts/search` and `api/v1/accounts/show`
   - `deals/api/v1/opportunities/search` and `deals/api/v1/opportunities/show`
   - `meetings/api/v1/notes/index`
3. Enter the API key when installing.

A master key also works, but it can call every Apollo endpoint, so prefer a key limited to the endpoints above.

## Tools

- **Find Contacts:** Search saved contacts by email address, name, job title, or company. Returns up to 5 matches with the contact ID and account ID the other tools need.
- **Get Contact:** Check a contact's title, company, location, phone numbers, lists, and last activity.
- **Find Accounts:** Search saved accounts by company name. Returns up to 5 matches with the account ID.
- **Get Account:** Check an account's domain, industry, size, location, and last activity.
- **List Contact Deals:** Check up to 10 deals associated with a contact, with amount, status, and close date.
- **Get Deal:** Check one deal's amount, status, close date, next step, and the contacts involved.
- **List Contact Notes:** Read the 5 most recent notes on a contact.

Start with Find Contacts, then use the contact ID or account ID with the other tools.

## Notes

- These tools only read records your team has saved in Apollo. They do not search Apollo's wider database or use credits.
- API access depends on your Apollo plan. A key that lacks an endpoint gets a 403 error, which Captain sees as a generic failure.
- Deals show stage names only when Apollo returns them; otherwise only won, closed, or open is shown.
