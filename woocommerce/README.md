Connect a WooCommerce store to help Captain look up customers, orders, and order notes.

## Setup

1. In WordPress, go to **WooCommerce → Settings → Advanced → REST API** and click **Add Key**. Choose a user who can view orders and customers, set the access level to **Read**, and generate the key.
2. Enter the consumer key, the consumer secret, and your store's domain, such as `shop.example.com`, when installing. Leave out `https://`.

## Tools

- **Find Customer by Email:** Find a customer account by email address. Returns the customer ID that List Customer Orders needs.
- **List Customer Orders:** Check a customer's 10 most recent orders, with status, total, and items.
- **Search Orders:** Search orders by a term such as an email address, name, or order number, and get the 10 most recent matches. Works for guest checkouts.
- **Get Order:** Check one order in full: up to 20 items, totals, payment method, shipping method and destination, refunds, and the customer's note.
- **List Order Notes:** Read the 10 most recent notes on an order, both internal notes and notes sent to the customer.

Start with Find Customer by Email, or Search Orders for guests, then use the order ID with Get Order and List Order Notes.

## Notes

- The store must use HTTPS, WooCommerce 3.5 or later, and pretty permalinks (any setting other than Plain under **Settings → Permalinks**).
- The key is sent with HTTP Basic authentication. Some servers drop the `Authorization` header, and WooCommerce then reports that the consumer key is missing; fix the server configuration so the header reaches WordPress.
- Shipment tracking is not part of WooCommerce itself. If a shipping plugin records tracking in order notes, List Order Notes shows it.
- Dates are in the store's time zone.
