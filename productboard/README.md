Connect Productboard to help Captain look up features and their status, read customer feedback, and log new feedback as notes for the product team.

## Setup

1. In Productboard, go to **Settings → Integrations → Public APIs → Access Token** and create a token with the plus icon. API tokens need the Pro plan or higher.
2. Enter the token when installing.

## Tools

- **Search Features:** Find features by name and get up to 10 matches with status and timeframe. Archived features are left out.
- **Get Feature:** Check one feature's status, timeframe, progress, health, owner, teams, and description.
- **List Feature Notes:** Read up to 10 feedback notes linked to a feature.
- **Find Customer:** Find a Productboard user, meaning one of your customers, by email address. Returns the customer ID and their company ID.
- **List Customer Notes:** Read up to 10 feedback notes from a user or company, with the features each note is linked to.
- **Get Note:** Read one note in full, with tags, customer, and linked features.
- **Add Note:** Log a customer's feedback as a new text note, optionally attributed to an existing user by email.

Start with Search Features for questions about a feature. For questions about a customer's own feedback, start with Find Customer.

## Notes

- These tools use Productboard REST API v2 and send `Accept: application/json` with every request, as that API requires.
- Add Note is the only tool that changes data. Productboard rejects a note attributed to an email it does not know, so Captain only passes an email that Find Customer returned.
- Feature fields depend on your workspace configuration. Fields that are empty or not enabled are left out.
- Notes list linked features by ID. Use Get Feature to see a linked feature's name and status.
