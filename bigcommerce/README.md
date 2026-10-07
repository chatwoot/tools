Connect a BigCommerce store to help Captain look up customers, orders, order items, and shipments.

## Setup

1. Create a store-level API account in BigCommerce under Settings > API > Store-level API accounts. Set the Customers and Orders scopes to read-only and leave the rest at none.
2. Copy the access token. Find the store hash in the API path shown with it: for `https://api.bigcommerce.com/stores/abc123xyz/v3/`, the store hash is `abc123xyz`.
3. Enter the access token and store hash when installing.

## Tools

- **Find Customers by Email:** Find a customer account by email address, with name, phone, company, store credit, and customer ID. Guests who checked out without an account are not listed.
- **Find Orders by Email:** Find the 10 most recent orders placed with an email address, including guest orders, with status, total, and payment status. Returns the order ID the other tools need.
- **Get Order:** Read one order by order ID, with status, payment, totals, discounts, refunds, and the customer's order comment.
- **List Order Products:** List up to 20 items in an order with SKU, options, quantity, price, and how many were shipped or refunded.
- **List Order Shipments:** List up to 10 shipments of an order with carrier, tracking number, tracking link, ship date, and destination.

Start with Find Orders by Email, or go straight to Get Order when the customer gives an order number.

## Notes

- Customer lookup uses the V3 Customers API. The order tools use the V2 Orders API.
- Amounts are shown in the order's currency as BigCommerce returns them, including tax.
- These tools only read data. Captain cannot edit, cancel, or refund orders.
