Connect a Printify shop to help Captain check order production and shipment tracking, existing support requests, products, and shipping costs.

## Setup

1. In Printify, open **My Profile → Connections** and generate a personal access token.
2. Give the token these access scopes: `shops.read`, `orders.read`, `products.read`, and `catalog.read`.
3. Copy the token when it is shown; Printify only displays it once.
4. Find your shop ID by listing your shops with the token:

   ```sh
   curl https://api.printify.com/v1/shops.json \
     -H "Authorization: Bearer YOUR_TOKEN" \
     -H "User-Agent: Chatwoot Captain"
   ```

   Use the `id` of the shop you want Captain to read.
5. Enter the token and shop ID when installing.

## Tools

- **List Orders:** List orders 10 at a time with status, your store's order number, customer name and email, and tracking.
- **Get Order:** Check one order's production status, items, shipping method, shipments, and delivery dates.
- **List Order Support Requests:** Check the reprint, refund, cancellation, or address-change requests opened for an order, and their status.
- **List Products:** List products 10 at a time with how many variants are on sale and available.
- **Get Product:** Check one product's description and the price, SKU, and availability of up to 30 variants on sale.
- **Get Shipping Info:** Check a product's handling time and shipping costs by destination, for up to 20 shipping profiles.

Start with List Orders to find the order, then use its order ID with Get Order. For shipping questions, use List Products, then Get Product, then Get Shipping Info.

## Notes

- Personal access tokens expire after one year. Generate a new token and update the integration before then.
- Printify cannot search orders by customer email or order number, so Captain pages through List Orders. Start with page 1.
- Prices are shown as plain numbers because Printify does not return a currency for product prices.
- Get Shipping Info returns the costs Printify charges your shop, which may differ from what you charge customers. Your production costs are never shown to Captain.
- These tools send `User-Agent: Chatwoot Captain`, because Printify requires a User-Agent header on every request.
- All tools are read-only.
