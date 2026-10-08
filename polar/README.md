Connect Polar to help Captain look up customers, subscriptions, orders, invoices, and granted benefits.

## Setup

1. In Polar, open your organization's Settings and create an organization access token under Developers.
2. Give the token only these scopes: `customers:read`, `subscriptions:read`, `orders:read`, and `benefits:read`.
3. Enter the token when installing.

## Tools

- **Find Customers:** Find up to 10 customers by email address, name, or external ID. Returns the customer ID the other tools need.
- **Get Customer State:** Get an overview of a customer's active subscriptions, granted benefits, and usage meter balances.
- **List Subscriptions:** Check a customer's 10 most recently started subscriptions, including canceled ones, with product, price, renewal date, trial, and cancellation details.
- **List Orders:** Check a customer's 10 most recent orders, with status, totals, refunds, and invoice numbers.
- **Get Order:** Read one order's line items, discount, tax, refunds, and whether its invoice has been generated.
- **Get Order Invoice:** Get the download link for an order's invoice.
- **List Benefit Grants:** Check the 20 most recent benefits granted to a customer, such as license keys or downloads, and whether each was revoked.

Start with Find Customers, then use the customer ID with the other tools.

## Notes

- These tools set `Polar-Version: 2026-10` for all requests. Polar removes each API version about nine months after its release, so this header needs to be updated before 2026-10 is retired.
- The tools use the production API at `api.polar.sh`. Sandbox organizations are not supported.
- Get Order Invoice only works after an invoice has been generated for the order. Captain cannot generate one.
- License keys are shown in their masked display form.
