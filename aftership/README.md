Connect AfterShip Tracking to help Captain check where a shipment is, when it should arrive, and its tracking history.

## Setup

Create an API key in AfterShip under Settings > API keys. Enter the key when installing.

## Tools

- **Find Tracking by Number:** Look up a shipment by its tracking number, with status, delivery estimate, latest update, and tracking page links. Returns the tracking ID that Get Tracking needs.
- **Search Trackings:** Search shipments by a keyword such as an order number, customer email address, or customer name. Returns up to 5 matches.
- **Get Tracking:** Read one shipment in full, including the 10 most recent tracking events, shipping service, failed delivery attempts, and the courier's link for changing a delivery when there is one.
- **Detect Courier:** Identify up to 5 couriers a tracking number could belong to, with their courier codes.
- **Add Tracking:** Start tracking a shipment that is not in AfterShip yet. The courier is detected automatically unless a courier code is given.

Start with Find Tracking by Number when the customer has a tracking number, or Search Trackings when they only have an order number or email address.

## Notes

- These tools use AfterShip Tracking API version `2026-07`.
- Add Tracking creates a shipment in your AfterShip account, which counts toward your plan's shipment quota. Turn the tool off if Captain should only read existing shipments.
- A newly added shipment starts as pending until AfterShip gets the first update from the courier.
- Event times are shown as the courier reports them, usually in the local time of the event.
