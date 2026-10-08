Connect Razorpay to help Captain check payments, refunds, orders, and subscriptions by their Razorpay ID.

## Setup

In the Razorpay Dashboard, switch to **Live** mode, go to **Account & Settings > API Keys**, and generate a key. Enter the key ID and key secret when installing. Razorpay shows the key secret only once, and its API keys give full API access, with no read-only option.

## Tools

- **Get Payment:** Check a payment by its ID, including amount, status, method, failure reason, refunded amount, and bank reference numbers.
- **List Payment Refunds:** Check the 10 most recent refunds for a payment, with amount, status, speed, and bank reference number.
- **Get Order:** Check an order by its ID, including amount, amount paid, amount due, status, and number of payment attempts.
- **List Order Payments:** List up to 10 payment attempts for an order, both successful and failed, with failure reasons and refunded amounts.
- **Get Subscription:** Check a subscription by its ID, including status, plan ID, current billing cycle, next charge date, and billing cycles paid and remaining.

Razorpay cannot search by email address, so Captain asks the customer for a payment ID (`pay_`), order ID (`order_`), or subscription ID (`sub_`). Payment results include the email address and phone number used, so Captain can check they match the customer.

## Notes

- Test mode keys return test data only.
- Razorpay returns an error for an ID that does not exist, so Captain sees a generic failure rather than a "not found" message.
- Subscriptions show the plan ID, not the plan name or price.
