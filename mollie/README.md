Connect Mollie to help Captain check payments, refunds, subscriptions, and mandates.

## Setup

In the Mollie dashboard, go to **Developers > API keys** and use one of these:

- **Access token (recommended):** Create an organization access token with only these permissions: `payments.read`, `refunds.read`, `customers.read`, `subscriptions.read`, and `mandates.read`.
- **Live API key:** Copy the live API key of the website profile whose payments Captain should check. An API key can also create payments and refunds, so prefer the access token.

Enter the token or key when installing.

## Tools

- **Get Payment:** Check one payment by its ID, including status, amount, method, failure reason, refunded amount, and the customer ID it belongs to.
- **List Payment Refunds:** Check the 10 most recent refunds for one payment, with amount, status, and description.
- **Get Customer:** Look up one customer by ID to confirm their name and email address.
- **List Customer Payments:** Check a customer's 10 most recent payments, with status, amount, method, failure reason, and refunded amount.
- **List Customer Subscriptions:** Check a customer's 10 most recent subscriptions, including canceled ones, with amount, interval, and next payment date.
- **List Customer Mandates:** Check a customer's 10 most recent mandates, with method, status, and the card or bank account ending.

Start with Get Payment when the customer gives a payment ID starting with `tr_`. It returns the customer ID the customer tools need.

## Notes

- Mollie's API cannot search customers or payments by email address. Captain needs a payment ID (`tr_...`) from the customer, or a Mollie customer ID (`cst_...`) that you store on the contact.
- The customer tools only cover payments created with a Mollie customer attached. One-off payments without a customer can still be checked with Get Payment.
- Live keys and tokens return live data only. Test payments are not found.
