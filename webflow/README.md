Connect a Webflow site to help Captain look up e-commerce orders and products, and read published CMS items such as help articles or blog posts.

## Setup

1. In Webflow, open the site's settings and go to **Apps & integrations**. In the **API access** section, click **Generate API token**. Only site administrators can do this.
2. Name the token and give it read-only access to these scopes:
   - **Ecommerce:** Read (`ecommerce:read`)
   - **CMS:** Read (`cms:read`)
3. Copy the site ID from the site's settings.
4. Enter the token and site ID when installing.

## Tools

- **Get Order:** Check one order by its order ID, with status, items, totals, card brand and last four digits, shipping address, tracking, downloads, comments, and refund or dispute dates.
- **List Recent Orders:** Check 10 orders at a time, with order ID, status, date, total, and customer name and email.
- **List Orders by Status:** Check 10 orders at a time in one status: pending, unfulfilled, fulfilled, disputed, dispute-lost, or refunded.
- **List Products:** Check 20 products at a time, with product ID and up to 8 SKUs each with price.
- **List Collections:** List up to 40 CMS collections with their collection IDs.
- **List Collection Items:** Check the 20 most recently published items in a collection, with name, slug, and publish date.
- **Find Collection Item by Slug:** Read one published item's fields by its exact slug. Shows up to 30 fields, each cut to 300 characters.

For orders, start with Get Order when the customer knows their order ID. For CMS content, start with List Collections.

## Notes

- Webflow's API cannot search orders by customer email. Captain has to ask for the order ID or page through recent orders.
- Order and product tools need Webflow Ecommerce to be enabled on the site.
- SKU prices are shown as the price value divided by 100, which is wrong for currencies without minor units, such as JPY. Order totals use Webflow's own formatted amounts.
- Only published (live) CMS items are returned. Drafts and staged changes are left out.
- Site tokens are tied to one site and expire after 365 days without use. Webflow recommends OAuth apps for integrations that span many sites; a site token fits this single-site setup.
