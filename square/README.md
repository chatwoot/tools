Connect Square to help Captain check customer orders, payments, refunds, invoices, and subscriptions.

## Setup

1. In the [Square Developer Console](https://developer.squareup.com/apps), open your application or create one, choose **Credentials**, switch to **Production**, and copy the **Production Access token**. Square personal access tokens give full access to the account and cannot be limited to read-only, so store the token only here and replace it if it leaks.
2. Open **Locations** for the same application and copy the ID of the location whose orders and invoices Captain should check.
3. Enter the access token and location ID when installing.

## Tools

- **Find Customers by Email:** Find customer profiles by exact email address. Returns the customer ID the other tools need.
- **List Orders:** Check a customer's 10 most recent orders at the configured location, with items, totals, refunds, and the payment ID of each payment.
- **Get Payment:** Check one payment, including status, amount, card, failure reasons, refunded amount, refund IDs, and the receipt link.
- **Get Refund:** Check the status, amount, and reason of one refund.
- **List Invoices:** Check a customer's 10 most recent invoices at the configured location, with status, amounts requested and paid, due dates, and the payment page link. Draft invoices are left out.
- **List Subscriptions:** Check a customer's subscriptions, including canceled ones, with status, start date, paid-through date, and any scheduled cancellation.

Start with Find Customers by Email, then use the customer ID with the list tools. Use a payment ID from List Orders with Get Payment, and a refund ID from Get Payment with Get Refund.

## Notes

- These tools set `Square-Version: 2026-09-16` for all requests and call the production API. Sandbox tokens do not work.
- Square cannot list payments by customer, so payments are found through the customer's orders. Orders and invoices are checked at one location. Subscriptions are checked across all locations.
- Only orders and invoices linked to the customer profile are found. A sale taken without a customer attached does not appear.
- Subscriptions show the plan variation ID, not the plan name.
