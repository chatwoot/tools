Connect Xendit to help Captain look up transactions, payments, customers, and subscription plans.

## Setup

1. In the Xendit dashboard, go to Settings > API Keys and generate a secret key.
2. Give the key Read permission for the products you want Captain to look up, including Transaction, and leave everything else set to None.
3. Enter the secret key when installing.

## Tools

- **Find Transactions by Reference:** Find up to 10 transactions by the reference your business assigned to the payment. The match is exact and case sensitive. Returns the transaction ID and product ID the other tools need.
- **Get Transaction:** Read one transaction's type, status, amount, fees, net amount, and settlement status.
- **Get Payment Request:** Check a payment request's status, amount, channel, failure reason, and any step the customer still needs to complete.
- **Get Payment:** Check a single payment's status, amount, captures, channel, and failure reason.
- **Find Customer by Reference:** Find a customer by the reference ID your business assigned to them.
- **Get Subscription Plan:** Read a subscription plan's status, amount, billing schedule, retry settings, and items.
- **List Subscription Cycles:** Check up to 10 billing cycles of a subscription plan, with payment attempts and failure reasons.

Start with Find Transactions by Reference when the customer has an order or payment reference.

## Notes

- Xendit's API cannot search by customer email address. Captain needs a reference your business assigned, or a Xendit ID such as a payment request ID (`pr-`), payment ID (`py-`), or subscription plan ID (`repl_`), so these tools work best when those values are available in the conversation.
- Xendit cannot list the subscription plans of a customer, so the plan ID has to come from your own records.
- The tools do not send an `api-version` header, so each endpoint uses Xendit's default version. Find Customer by Reference reads both the current and the older customer format.
- Use a live secret key for real transactions. A test key only returns test data.
- Sub-accounts on xenPlatform are not supported; lookups run against the account that owns the key.
