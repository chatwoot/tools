Connect Sendcloud to help Captain track parcels, look up orders and shipments, share return portal links, and validate delivery addresses.

## Setup

1. In Sendcloud, open Settings > Integrations, find **Sendcloud API**, and click **Connect**. Name the integration and save it to generate a public key and a secret key.
2. Leave **Use OAuth2 authentication** turned off for this integration. These tools sign requests with the key pair using Basic authentication, which Sendcloud rejects when that setting is on.
3. Enter the public key and secret key when installing. Sendcloud keys are not scoped, so they have full access to the account. These tools only read data and validate addresses.

## Tools

- **Track Parcel:** Get the expected delivery date, carrier tracking link, and the 8 most recent tracking events for a tracking number.
- **Find Orders by Order Number:** Find up to 5 synced shop orders with an order number, with status, customer, delivery address, total, and items.
- **Find Shipments by Order Number:** Find up to 5 shipments for an order number, with carrier, parcel status, tracking number, and tracking link.
- **Find Shipments by Tracking Number:** Find the shipment a tracking number belongs to, with its order number and recipient.
- **Get Shipment:** Get one shipment with its full delivery address, carrier, delivery dates, up to 10 parcels, and their items.
- **Get Return Portal Link:** Get the return portal link for a shipment so the customer can start a return themselves.
- **Validate Address:** Check an address for a carrier and get Sendcloud's recommended correction.

To answer "where is my order?", use Find Shipments by Order Number, then Track Parcel with the tracking number.

## Notes

- These tools use Sendcloud API v3 at `panel.sendcloud.sc/api/v3`.
- Sendcloud cannot search orders or shipments by customer name or email. Captain needs an order number or a tracking number.
- The shipment tools return shipments created or imported under these API credentials. Find Orders by Order Number only returns orders that a shop integration or the Orders API synced into Sendcloud.
- Get Return Portal Link fails when no return portal is configured for the shipment's brand, and Captain then only sees a generic error.
- Validate Address needs a carrier code for a carrier that is enabled in your Sendcloud account.
