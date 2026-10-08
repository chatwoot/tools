Connect Paystack to help Captain check customer transactions, refunds, and subscriptions.

## Setup

In the Paystack dashboard, go to **Settings > API Keys & Webhooks** and copy your live secret key. Enter it when installing. Paystack secret keys give full access to the account and cannot be limited to read-only, so store the key only here and replace it if it leaks.

## Tools

- **Find Customer by Email:** Find a customer by email address. Returns the numeric customer ID the list tools need, plus up to 3 saved payment methods.
- **List Transactions:** Check a customer's 10 most recent transactions, with reference, amount, status, channel, and the gateway's response for failures.
- **Verify Transaction:** Check one transaction by its reference, including status, amount, channel, payment method, and the gateway's response.
- **List Refunds:** Check up to 10 refunds for one transaction reference, with amount, status, and the expected or completed date.
- **List Subscriptions:** Check a customer's 10 most recent subscriptions, with plan, amount, billing interval, status, and next payment date.

Start with Find Customer by Email, then use the numeric customer ID with List Transactions and List Subscriptions. Use a transaction reference with Verify Transaction and List Refunds.

## Notes

- A live secret key returns live data only. To check test transactions, install with a test secret key instead.
- Paystack answers an unknown email address or transaction reference with an error, so Captain sees a generic failure instead of a "not found" message.
- Amounts are converted from the currency's subunit, such as kobo or pesewas, by dividing by 100.
