Connect ShipStation to help Captain find orders, check shipping labels and package tracking, and validate delivery addresses.

## Setup

1. In ShipStation, open Settings > Account > API Settings and generate an API key under API V2. The key is shown only once, so copy it right away. If the page shows no API V2 section, your plan does not include API access.
2. Enter the key when installing. ShipStation API keys are not scoped, so the key has full access to the account. These tools only read data and validate addresses.

## Tools

- **Find Shipments by Order Number:** Find up to 10 shipments with an order number, with status, recipient, items, and shipment ID.
- **Find Shipments by Recipient:** Find the 10 most recent shipments addressed to a recipient name.
- **Get Shipment:** Get one shipment with its status, delivery address, up to 15 items, requested service, and ship-by dates.
- **List Shipment Labels:** List up to 10 labels created for a shipment, with carrier, tracking number, and tracking status.
- **Find Labels by Tracking Number:** Find up to 5 labels with a tracking number, and the shipment each belongs to.
- **Track Label:** Get the tracking status, delivery dates, and the 8 most recent scan events for a label created in ShipStation.
- **Track Package:** Get the tracking status and the 8 most recent scan events for any carrier code and tracking number.
- **Validate Address:** Check an address and get the corrected, standardized version with any warnings.
- **List Carriers:** List up to 50 connected carriers and their carrier codes.

To answer "where is my order?", use Find Shipments by Order Number, then List Shipment Labels, then Track Label.

## Notes

- These tools use ShipStation API V2 at `api.shipstation.com`, which ShipStation recommends for new integrations. A legacy V1 API key and secret will not work.
- In API V2, an order appears as a shipment, and the order number is the shipment number. A shipment with the status `label purchased` has shipped.
- Shipments cannot be searched by customer email. Use the order number or the recipient's name.
- API access, address validation, and tracking for packages shipped outside ShipStation depend on your ShipStation plan.
