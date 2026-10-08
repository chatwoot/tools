Connect RevenueCat to help Captain check customer subscriptions, purchases, and entitlements.

## Setup

In RevenueCat, open your project and go to **API keys**. Create a secret API key, select **V2** as the version, and give it read access to customer information: `customer_information:customers:read`, `customer_information:subscriptions:read`, and `customer_information:purchases:read`. When installing, enter the key and your project ID, which starts with `proj`.

## Tools

- **Find Customers:** Find up to 5 customers by email address, app user ID, or store transaction ID. Returns the customer ID the other tools need.
- **Get Customer:** Get a customer's profile, including last seen date, platform, app version, active entitlements, and up to 15 attributes such as email and display name.
- **List Active Entitlements:** List up to 20 entitlements a customer currently has access to, with expiry dates.
- **List Subscriptions:** Check a customer's 10 most recent subscriptions, with status, store, entitlements, current period end, renewal status, pending payment, and management link.
- **List Purchases:** Check a customer's 10 most recent purchases, with date, status, store, product, quantity, and entitlements.

Start with Find Customers, then use the customer ID with the other tools.

## Notes

- These tools use RevenueCat REST API v2. A v1 secret key does not work.
- Searching by email only finds customers whose `$email` attribute is set in RevenueCat.
- Subscriptions and purchases made in store sandbox environments are left out.
- Products are shown by their RevenueCat product ID, and active entitlements by their entitlement ID.
