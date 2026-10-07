Connect Lemon Squeezy to help Captain check customer orders, subscriptions, invoices, and license keys.

## Setup

In Lemon Squeezy, go to **Settings > API** and create an API key in live mode. Enter the key when installing. Lemon Squeezy API keys have no scopes, give access to every store on the account, and expire after one year.

## Tools

- **Find Customers by Email:** Find customers by email address, with their total spend and location.
- **List Orders:** Check the 10 most recent orders for an email address, with product, total, status, refunds, and receipt links.
- **List Subscriptions:** Check the 10 most recent subscriptions for an email address, including cancelled and expired ones, with product, status, renewal or end date, trial, pause, and card.
- **List Subscription Invoices:** Check the 10 most recent invoices for a subscription, with total, status, billing reason, refunds, card, and invoice links.
- **List License Keys:** Check the license keys issued for an order, with status, activations used, activation limit, and expiry. Keys are shown shortened.

Orders and subscriptions are looked up by email address. List Subscription Invoices needs a subscription ID from List Subscriptions, and List License Keys needs an order ID from List Orders.

## Notes

- A key created in test mode returns test data only.
- Results cover every store on the account.
- Customer portal and payment method links are left out of the results. Receipt and invoice links are signed links to that customer's order.
