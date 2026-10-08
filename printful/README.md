Connect a Printful store to help Captain check order fulfillment and shipment tracking, product availability, and shipping rates.

## Setup

1. Open the [Printful Developer Portal](https://developers.printful.com/tokens) and create a private token.
2. Choose **Store** access for the store you want Captain to read. Account-level tokens will not work, because they need a store ID on every request.
3. Give the token the `orders/read` and `sync_products/read` scopes.
4. Copy the token when it is created; Printful does not show it again. Enter it when installing.

## Tools

- **Get Order by External ID:** Check an order's status, items, and shipment tracking using the order ID from your connected store, such as Shopify or WooCommerce.
- **Get Order:** Check the same details using the Printful order ID.
- **List Orders:** List orders 10 at a time with status, recipient name and email, and tracking.
- **Search Products:** Search your synced products by name. Shows up to 10 matches.
- **Get Product:** Check a product's variants with retail price, SKU, and availability. Shows up to 30 variants.
- **Calculate Shipping Rates:** Get shipping options, rates, and estimated delivery days for a variant and destination.

Start with Get Order by External ID when the customer has an order number from your store. For shipping questions, use Search Products, then Get Product, then Calculate Shipping Rates.

## Notes

- Printful private tokens have an expiration date. Create a new token and update the integration before the old one expires.
- Printful cannot search orders by customer email, so List Orders pages through orders and shows each recipient's name and email. For List Orders, start with offset 0 and add 10 to read the next group.
- Search Products and Get Product read the products synced from a connected e-commerce platform such as Shopify, WooCommerce, or Etsy.
- Calculate Shipping Rates returns the rates Printful charges your store, which may differ from what you charge customers.
- Orders show retail totals only when the order has retail prices. Your Printful fulfillment costs are never shown to Captain.
- All tools are read-only. Calculate Shipping Rates sends a POST request but does not change anything in Printful.
