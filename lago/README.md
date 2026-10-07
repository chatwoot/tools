Connect Lago to help Captain look up customers, subscriptions, invoices, payments, prepaid wallets, and current usage.

## Setup

1. In Lago, create an API key under Developers > API keys. If your plan includes API key permissions, give the key read access only to customers, subscriptions, invoices, payments, wallets, and customer usage.
2. Find your API host. Use `api.getlago.com` for Lago Cloud in the US and `api.eu.getlago.com` for Lago Cloud in the EU. For self-hosted Lago, use the host name of your own API, without `https://` or a path.
3. Enter the API key and API host when installing.

## Tools

- **Find Customers:** Find up to 10 customers by email address, name, or external ID. Returns the external customer ID the other tools need.
- **List Subscriptions:** Check up to 10 of a customer's subscriptions in any status, with plan, base price, billing period, and end or downgrade dates.
- **List Invoices:** Check a customer's 10 most recent invoices, with status, payment status, total, amount due, and PDF link.
- **Get Invoice:** Read one invoice's line items (up to 15), taxes, credits, amount paid, and amount due.
- **List Payments:** Check a customer's 10 most recent payments, with amount, status, provider, and the invoices each one paid.
- **List Wallets:** Check up to 10 of a customer's prepaid credit wallets, with balance, consumed credits, and expiration.
- **Get Current Usage:** Check usage and charges so far in the current billing period for one subscription, broken down by billable metric (up to 20).

Start with Find Customers, then use the external customer ID with the other tools.

## Notes

- Customers are identified by the external ID you assigned to them in Lago, not by Lago's internal ID.
- Self-hosted Lago must be reachable over HTTPS from Chatwoot.
- Restricting an API key by permission is part of Lago's premium plans. On other plans the key has full access, so store it carefully.
- An invoice's PDF link is only shown once Lago has generated the file.
