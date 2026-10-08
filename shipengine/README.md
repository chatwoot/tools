Connect ShipEngine to help Captain track packages, look up shipping labels and shipments, and validate delivery addresses.

## Setup

1. In the ShipEngine dashboard (now branded ShipStation API), switch to the Production environment and create an API key under API Management. Sandbox keys start with `TEST_` and only return sandbox data.
2. Enter the key when installing. ShipEngine API keys are not scoped, so the key has full access to the account. These tools only read data and validate addresses.

## Tools

- **Track Package:** Get the tracking status, delivery dates, and the 8 most recent scan events for any carrier code and tracking number.
- **Find Labels by Tracking Number:** Find up to 5 labels with a tracking number, with status, carrier, and the shipment each belongs to.
- **Find Labels by External Shipment ID:** Find the 5 most recent labels for the external shipment ID your system set, such as an order number.
- **Get Label:** Get one label with its status, carrier and service, cost, tracking, recipient, and void or refund details.
- **Track Label:** Get the tracking status, delivery dates, and the 8 most recent scan events for a label created in ShipEngine.
- **Get Shipment:** Get one shipment with its status, delivery address, service, tags, and up to 15 items.
- **Validate Address:** Check an address and get the corrected, standardized version with any warnings.
- **List Carriers:** List up to 50 connected carriers and their carrier codes.

Start with a Find Labels tool to get a label ID, then use Track Label. Use Track Package for packages that were not shipped through ShipEngine.

## Notes

- Track Package and Validate Address need the ShipEngine Advanced plan or higher. Tracking requests beyond the plan's monthly limit are billed as overage.
- ShipEngine cannot search labels or shipments by customer name or email. Captain needs a tracking number or the external shipment ID your system stored.
- These tools call `api.shipengine.com`. ShipEngine was renamed ShipStation API in 2025, and the endpoints and API keys did not change.
