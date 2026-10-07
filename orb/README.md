Connect Orb to help Captain look up customers, subscriptions, invoices, upcoming charges, and prepaid credit balances.

## Setup

Create an API key in the Orb web application and enter it when installing. Use a key dedicated to Captain so it can be revoked on its own.

## Tools

- **Get Customer by External ID:** Look up a customer by the ID your own system uses for them. Returns the Orb customer ID the other tools need, along with the account balance.
- **Get Customer:** Get a customer's details and account balance using the Orb customer ID.
- **List Subscriptions:** Check a customer's 5 most recently created subscriptions, including upcoming and ended ones, with plan, status, billing period, and trial dates.
- **List Invoices:** Check a customer's 10 most recent issued, paid, or synced invoices, with total, amount due, due date, and links to view or download them. Draft and void invoices are left out.
- **Get Invoice:** Read one invoice's line items (up to 15), subtotal, total, amount due, and payment attempts.
- **Get Upcoming Invoice:** Preview the next invoice for a subscription's current billing period.
- **List Credit Balances:** Check a customer's unexpired prepaid credit blocks (up to 20), with remaining balance and expiry date.

Start with Get Customer by External ID, then use the Orb customer ID with the other tools.

## Notes

- Orb's API cannot search customers by email address or name. Captain needs the customer's external customer ID, so these tools work best when that ID is available in the conversation, for example as a contact attribute.
- List Credit Balances reports balances in Orb's default `credits` pricing unit. Credit ledgers kept in a real currency or another custom pricing unit are not shown.
