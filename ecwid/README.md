Connect an Ecwid store to help Captain look up orders, shipment tracking, customers, and product stock.

## Setup

1. In your Ecwid admin, open the [app dashboard](https://my.ecwid.com/#develop-apps). Ecwid creates a custom app for your store the first time you open it.
2. Open the custom app's **Details** page and copy the **secret token**. It starts with `secret_`. Do not use the public token.
3. Check that the app has the `read_orders`, `read_catalog`, and `read_customers` access scopes. To add one, click **Manage App**, select it under **Access Scopes**, save, then uninstall and reinstall the app and copy the new secret token. `read_customers` is only needed for Find Customers.
4. Find your store ID in the footer of any Ecwid admin page.
5. Enter the secret token and store ID when installing.

## Tools

- **Find Orders by Email:** Find up to 10 of a customer's orders by checkout email, with payment and fulfillment status, shipping method, and tracking number.
- **Search Orders:** Search orders by keyword, such as a customer name, order ID, tracking number, or SKU. Shows up to 10 matches.
- **Get Order:** Check one order's status, items, totals, refunds, shipping address, shipping method, and tracking.
- **Find Customers:** Find up to 5 customers by email or name, with order count, total spend, customer group, and saved addresses.
- **Search Products:** Search the catalog by name or SKU and see price and stock for up to 10 products.
- **Get Product:** Check one product's price, options, description, and the stock and price of up to 25 variations.

Start with Find Orders by Email or Search Orders, then use the order ID with Get Order.

## Notes

- Ecwid's API is available to stores on paid plans only.
- All tools are read-only.
- Order and customer amounts are plain numbers in your store's currency; Ecwid does not return a currency code with them.
