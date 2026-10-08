Connect a Shopify store to help Captain look up customers, orders, and shipment tracking.

## Setup

1. In your Shopify admin, open **Apps → Develop apps**, select your custom app, and copy its Admin API access token from **API credentials**. The app needs the `read_customers` and `read_orders` access scopes.
2. Enter the token and your store's `myshopify.com` domain, such as `your-store.myshopify.com`, when installing. Leave out `https://`.

## Tools

- **Find Customers by Email:** Find up to 5 customers by email address, with order count, total spent, tags, and note. Returns the customer ID that List Customer Orders needs.
- **List Customer Orders:** Check a customer's 10 most recent orders, with payment status, fulfillment status, and tracking numbers.
- **Find Orders by Email:** Find the 10 most recent orders placed with an email address, including guest checkouts.
- **Find Order by Number:** Find an order by the number the customer sees, such as #1001.
- **Get Order:** Check one order in full: up to 20 line items, shipping destination, shipments with tracking and delivery dates, refunds, and the order status page link.

Start with Find Customers by Email or Find Order by Number, then use the order ID with Get Order.

## Notes

- These tools need a long-lived Admin API access token from a custom app created in the Shopify admin. Shopify no longer lets you create new apps this way; existing ones keep working. Apps created in the Dev Dashboard issue tokens that expire after 24 hours, which Captain cannot renew.
- Shopify only returns orders from the last 60 days unless the app also has the `read_all_orders` scope, which needs Shopify's approval.
- These tools call the GraphQL Admin API version `2026-10`.
- Order amounts are shown in the store's currency.
