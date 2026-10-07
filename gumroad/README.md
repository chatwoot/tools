Connect Gumroad to help Captain look up a customer's purchases, license keys, and subscriptions, and answer questions about your products.

## Setup

1. In Gumroad, open **Settings → Advanced** and create an application. Give it any name, and enter `http://127.0.0.1` as the redirect URI.
2. Open the application and click **Generate access token**.
3. Enter the access token when installing.

The token belongs to your own Gumroad account and does not expire until you revoke it. The sales and subscriber tools need the `view_sales` scope; the product tools need `view_profile`.

## Tools

- **Find Sales by Email:** Find a customer's purchases by email address, showing up to 10 with status, license key, and the IDs the other tools need.
- **Find Sales by License Key:** Find the sale a license key belongs to, and check whether the key is disabled and how often it has been used.
- **Get Sale:** Check one sale's total, refund and dispute status, card, discount code, license key, custom fields, and shipping details for physical products.
- **List Products:** List up to 25 products on the account with price, status, and link.
- **Get Product:** Check one product's price, description, variants or membership tiers, and whether it is published.
- **Find Subscribers by Email:** Find a customer's subscription to one membership product, with its status and cancellation or failed-payment dates.
- **Get Subscriber:** Check one subscription's status, billing interval, charge count, and end dates.

Start with Find Sales by Email, then use the sale, product, or subscription ID with the other tools.

## Notes

- All tools are read-only. Captain cannot refund a sale, change a license, or cancel a subscription.
- Gumroad only returns successful sales, so failed payment attempts do not appear.
- Find Subscribers by Email searches one product at a time, so Captain needs the product ID first.
