Connect Shippo to help Captain track packages, look up orders and shipping labels, and validate delivery addresses.

## Setup

1. In Shippo, open Settings > API (the Developer keys page) and generate a live API token. Tokens start with `shippo_live_`; a `shippo_test_` token only returns test data.
2. Enter the token when installing. Shippo tokens are not scoped, so the token has full access to the account. These tools only read data.

## Tools

- **Track Package:** Get the current status, estimated delivery date, destination, and the 6 most recent scan events for a carrier and tracking number.
- **List Orders:** List up to 25 orders placed within a date range, with order number, status, recipient, and order ID.
- **Get Order:** Get one order with its recipient address, up to 15 items, and up to 10 shipping labels with tracking numbers.
- **List Labels:** List 10 shipping labels in a given tracking state, such as transit, returned, or failure.
- **Get Label:** Get one shipping label with its purchase status, tracking number, tracking status, carrier tracking link, and carrier messages.
- **Validate Address:** Check an address and get Shippo's recommended correction, with a confidence score.
- **List Carrier Accounts:** List up to 40 connected carriers, whether each is active, and the carrier token Track Package needs.

To answer "where is my order?", use List Orders for the dates the customer ordered, Get Order for the tracking number, then Track Package.

## Notes

- Shippo cannot search orders by order number or customer email. List Orders filters by the date the order was placed, so Captain needs an approximate order date.
- Tracking is included for labels bought through Shippo. Shippo charges per tracking number for shipments created elsewhere, and some carriers only allow tracking for shipments created through Shippo.
- Address validation uses Shippo's `/v2/addresses/validate` endpoint and may be billed per lookup depending on your Shippo plan.
- These tools set `Shippo-API-Version: 2018-02-08` for all requests, so responses have the same shape regardless of your account's default API version.
