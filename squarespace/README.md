Connect a Squarespace store to help Captain find customers, check their orders and shipment tracking, and answer questions about products and stock.

## Setup

1. In Squarespace, open **Settings → Advanced → Developer API Keys** and click **Generate Key**.
2. Name the key and give it these permissions, all **Read Only**: **Orders**, **Products**, and **Contacts**.
3. Copy the key when it is shown. Squarespace only displays it once.
4. Enter the key when installing.

## Tools

- **Find Customers:** Find up to 5 customers by email address or name. Returns the customer ID that List Customer Orders needs.
- **List Customer Orders:** Check a customer's 10 most recent orders, with order number, payment and fulfillment status, total, and tracking.
- **Get Order:** Check one order's items, totals, refunds, shipping address, shipping method, and shipments.
- **List Products:** List the 25 most recently updated products with type and visibility, plus price and stock for single-variant products.
- **Get Product:** Check one product's description and the price, sale price, SKU, and stock of up to 25 variants.

Start with Find Customers, then List Customer Orders, then Get Order.

## Notes

- Developer API keys are available on Squarespace's Commerce Advanced plan.
- All tools are read-only.
- Squarespace cannot look up an order by its order number, so Captain finds orders through the customer's email address. Guest orders that are not linked to a customer record will not appear.
- List Customer Orders reads the 50 orders Squarespace returns for the customer and shows the 10 newest.
- These tools send `User-Agent: Chatwoot Captain`, because Squarespace rejects requests without a User-Agent header.
