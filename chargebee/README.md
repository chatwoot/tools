Connect Chargebee to help Captain check customer subscriptions, invoices, payments, and credit notes.

## Setup

In Chargebee, go to **Settings > Configure Chargebee > API Keys and Events > API keys** and add a **Read-only: All** key. When installing, enter the key and your Chargebee site name, which is the part before `.chargebee.com` in your Chargebee URL, such as `acme` for `acme.chargebee.com`.

## Tools

- **Find Customers by Email:** Find customers by exact email address. Returns the customer ID the other tools need.
- **List Subscriptions:** Check a customer's 10 most recent subscriptions, including cancelled ones, with plan and addon prices, billing period, next billing date, trial, and unpaid invoices.
- **List Invoices:** Check a customer's 10 most recent invoices, with status, total, amount due, due date, and payment retry status.
- **List Transactions:** Check a customer's 10 most recent payments and refunds, with amount, status, payment method, linked invoices, and the gateway's failure message.
- **List Credit Notes:** Check a customer's 10 most recent credit notes, with type, amount, reason, the invoice they were issued against, and how much was refunded or is still available.

Start with Find Customers by Email, then use the customer ID with the list tools.

## Notes

- These tools use Chargebee API v2. Test sites and live sites have different site names and API keys.
- Plans and addons are shown by their item price ID, such as `basic-USD`, not their display name.
- Amounts assume two decimal places, or none for zero-decimal currencies such as JPY. Sites with multi-decimal pricing may see rounded amounts.
