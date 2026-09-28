# Stripe

Connect Stripe to help Captain check customer payments, invoices, and subscriptions.

## Setup

Create a Stripe restricted API key with read access to Customers, Payment Intents, Charges, Invoices, and Subscriptions. Enter the key when installing this toolset.

## Tools

- **Find Customers by Email:** Find customers by email address, ignoring case. Returns the customer ID the other tools need.
- **List Payments:** Check a customer's 10 most recent payments, including decline reasons, refunds, card details, and receipt links.
- **List Invoices:** Check a customer's 10 most recent invoices, amounts due, and links to view, pay, or download them. Draft invoices are left out.
- **List Subscriptions:** Check a customer's subscriptions, including canceled ones, with plan, price, renewal date, trial, and cancellation status.

Start with Find Customers by Email, then use the customer ID with the list tools.

## Notes

- This toolset sets `Stripe-Version: 2026-08-26.dahlia` for all requests, so responses have the same shape regardless of your account's default API version.
- Customer search uses the Stripe Search API. Stripe does not offer search to businesses in India, and new or updated customers can take up to a minute to appear.
