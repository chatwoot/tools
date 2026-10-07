Connect GoCardless to help Captain check customer mandates, payments, subscriptions, and refunds.

## Setup

In the GoCardless dashboard, open **Developers**, select **Create access token**, and choose **Read-only** access. Enter the token when installing.

## Tools

- **Find Mandates by Reference:** Find mandates by the reference on the customer's bank statement or Direct Debit notification. Returns the mandate ID and customer ID the other tools need.
- **Get Customer:** Look up one customer by ID to confirm their name, company, and email address.
- **List Mandates:** Check a customer's 10 most recent mandates, with status, scheme, reference, and the earliest next charge date.
- **List Payments:** Check a customer's 10 most recent payments, with amount, charge date, status, refunded amount, and the mandate and subscription they belong to.
- **Get Payment:** Check one payment by its ID, including amount, charge date, status, and refunded amount.
- **List Payment Events:** Check the 10 most recent events for one payment, with the cause of a failure or cancellation and whether it will be retried.
- **List Subscriptions:** Check a customer's 10 most recent subscriptions, including cancelled and finished ones, with amount, interval, and up to 3 upcoming payments.
- **List Payment Refunds:** Check the 10 most recent refunds for one payment, with amount, status, and reference.

Start with Find Mandates by Reference, or with a GoCardless customer ID you store on the contact. Use Get Customer to confirm who the record belongs to before sharing details.

## Notes

- GoCardless's API cannot search customers by email address. Captain needs a mandate reference, a payment ID (`PM...`), or a customer ID (`CU...`).
- These tools set `GoCardless-Version: 2015-07-06` for all requests and call the live API at `api.gocardless.com`. Sandbox tokens do not work.
- GoCardless does not return events older than 18 months.
- Amounts are converted from the currency's smallest unit, such as pence or cents, by dividing by 100.
