Connect Paddle to help Captain check customer subscriptions, transactions, invoices, and refunds in Paddle Billing.

## Setup

In Paddle, go to **My account > Settings > Authentication**, open the **API keys** tab, and create an API key with read access to Customers, Subscriptions, Transactions, and Adjustments (`customer.read`, `subscription.read`, `transaction.read`, `adjustment.read`). Enter the key when installing.

## Tools

- **Find Customers by Email:** Find customers by exact email address, including archived ones. Returns the customer ID the other tools need.
- **List Subscriptions:** Check a customer's 10 most recent subscriptions, including canceled ones, with plan, price, next billing date, trial, and any scheduled pause or cancellation.
- **List Transactions:** Check a customer's 10 most recent transactions, with totals, status, items, payment method, and payment errors.
- **Get Invoice Link:** Get a link to the invoice PDF for a transaction. The link expires after one hour.
- **List Adjustments:** Check a customer's 10 most recent refunds, credits, and chargebacks, with amount, reason, and approval status.

Start with Find Customers by Email, then use the customer ID with the list tools. Get Invoice Link needs a transaction ID from List Transactions.

## Notes

- These tools work with Paddle Billing live accounts at `api.paddle.com`. Paddle Classic and sandbox accounts are not supported.
- Requests set `Paddle-Version: 1`.
- Paddle API keys expire, 90 days after creation by default and one year at most. Replace the key before it expires.
- Invoice PDFs exist only for completed transactions, or billed transactions that are collected by invoice. Zero-value transactions have no invoice.
- Links that let a customer change a payment method or cancel a subscription are left out of the results.
