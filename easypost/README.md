Connect EasyPost to help Captain track packages, look up shipments and labels, and verify delivery addresses.

## Setup

1. In the EasyPost dashboard, open Account Settings > API Keys and copy your production API key. A test key works too, but it only returns test-mode data and cannot list carrier accounts.
2. Enter the key when installing. EasyPost API keys are not scoped, so the key has full access to the account. These tools only read data, apart from the address record Verify Address saves.

## Tools

- **Find Tracker:** Look up a package by tracking number and get its status, estimated delivery date, and the 5 most recent scan events.
- **Get Tracker:** Get a tracker by ID with its status, delivery estimates, and the 10 most recent scan events.
- **List Shipments:** List up to 20 purchased shipments created within a date range, with recipient, reference, carrier, tracking number, and status.
- **Get Shipment:** Get one shipment with its recipient address, carrier and service, label date, tracking number, latest scan, and refund status.
- **Verify Address:** Check whether an address is deliverable and get EasyPost's corrected version, or the reasons it failed.
- **List Carrier Accounts:** List up to 40 carriers connected to the account.

Start with Find Tracker when the customer has a tracking number. Otherwise use List Shipments for the dates the order shipped, then Get Shipment.

## Notes

- Find Tracker only returns trackers that already exist in your account. EasyPost creates one automatically for every label bought through it. Captain never creates trackers, so tracking numbers from labels bought elsewhere are not found unless you registered them with EasyPost.
- EasyPost cannot search shipments by customer, email, or reference. List Shipments filters by creation date, so Captain needs an approximate ship date.
- Verify Address calls `POST /v2/addresses` with `verify` set, which saves an address record in your account and uses EasyPost's address verification service. Check your EasyPost plan for verification pricing.
- List Carrier Accounts only works with a production API key.
