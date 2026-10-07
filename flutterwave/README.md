Connect Flutterwave to help Captain look up transactions, refunds, subscriptions, and payment plans.

## Setup

1. In the Flutterwave dashboard, go to Settings > API Keys under Developers and copy your secret key.
2. Enter the secret key when installing.

Flutterwave secret keys cannot be restricted to read-only access, so the key has full access to your account. These tools only read data.

## Tools

- **Find Transactions by Email:** Find up to 10 transactions for an email address within a date range. Returns the transaction ID the other tools need.
- **Get Transaction:** Check one transaction's final status, amount charged, payment method, processor response, and customer, using the transaction ID.
- **Get Transaction by Reference:** Check the same details using your own transaction reference (`tx_ref`).
- **Get Transaction Timeline:** Read up to 25 timeline events for a transaction to see where a payment stopped.
- **List Refunds:** Check up to 10 refunds for a transaction, with amount, status, and date.
- **List Subscriptions:** Check up to 10 payment plan subscriptions for an email address, including cancelled ones.
- **Get Payment Plan:** Read a payment plan's name, amount, currency, interval, and status.

Start with Find Transactions by Email, or with Get Transaction by Reference when the customer has a payment reference.

## Notes

- These tools use the Flutterwave v3 API, which authenticates with your secret key. Flutterwave's v4 API uses short-lived OAuth tokens and is not supported.
- Use a live secret key for real transactions. A test key, which starts with `FLWSECK_TEST`, only returns test data.
- Flutterwave requires a date range to search transactions, so Captain searches the last 90 days unless the customer gives a date.
- Refunds and subscriptions do not include a currency. Refund amounts are in the currency of the original transaction, and Get Payment Plan shows the currency of a subscription.
