Connect a Whop business to help Captain look up customers, their memberships and payments, and the products and plans they bought.

## Setup

1. In the Whop dashboard, open the developer settings of the business you want to connect and create an **Account API key**.
2. Give the key a custom, read-only permission set instead of the Admin role. The tools read members and their email addresses, memberships, payments, products, and plans (`member:basic:read`, `member:email:read`, `payment:basic:read`, `plan:basic:read`).
3. Copy the key when Whop shows it and enter it when installing.

## Tools

- **Find Customer by Email:** Find a customer by email address. Returns the Whop user ID the other tools need, plus member status, purchase count, and lifetime value in USD.
- **List Memberships:** Check a customer's 10 most recent memberships, including canceled and expired ones, with status, renewal date, and product and plan IDs.
- **Get Membership:** Check one membership's status, billing period, cancellation date and reason, and the link where the customer manages billing.
- **List Payments:** Check a customer's 10 most recent payments, with amount, status, failure reason and decline code, refunds, and what was bought.
- **Get Payment:** Check one payment in full, with totals, tax, payment method type, failure and retry details, refund state, and dispute alerts.
- **Get Product:** Check a product's name, headline, description, and visibility.
- **Get Plan:** Check a plan's initial and renewal price, billing period, free trial, and access length.

Start with Find Customer by Email, then use the user ID with List Memberships and List Payments. Memberships return product and plan IDs; use Get Product and Get Plan to turn them into names and prices.

## Notes

- Use an Account API key for your own business. App API keys and OAuth tokens are for apps installed on other businesses and are not needed here.
- Customers who paid as a guest or as another business may have no Whop user ID, so their memberships and payments cannot be listed by user.
- License keys, payment client secrets, and payment recovery links are never included in what Captain sees.
- The tools call Whop's current `api/v1` endpoints without pinning an `Api-Version-Date`, so responses follow Whop's latest API version.
