Connect Recurly to help Captain check customer accounts, subscriptions, invoices, and transactions.

## Setup

1. In Recurly, go to **Integrations > API Credentials** and select **Add Private API Key**. Recurly private keys give full access to the site and cannot be limited to read-only, so create a key used only for Captain.
2. When installing, enter the key and choose your API host: `v3.recurly.com` for sites hosted in the US, or `v3.eu.recurly.com` for sites hosted in the EU.

## Tools

- **Find Accounts by Email:** Find accounts by exact email address. Returns the account ID the other tools need.
- **List Subscriptions:** Check an account's 10 most recent subscriptions, including canceled and expired ones, with plan, price, add-ons, renewal date, trial, pause, and cancellation details.
- **List Invoices:** Check an account's 10 most recent invoices and credit invoices, with state, total, amount paid, balance due, and due date.
- **Get Invoice:** Check one invoice by number, with up to 10 line items, the 5 most recent payment attempts with decline messages, and the balance due.
- **List Transactions:** Check an account's 10 most recent transactions, including refunds and declines, with payment method, decline message, and invoice number.
- **Get Account Balance:** Check an account's outstanding balance per currency and whether it is past due.

Start with Find Accounts by Email, then use the account ID with the other tools.

## Notes

- These tools use Recurly API v2021-02-25, set through the `Accept: application/vnd.recurly.v2021-02-25` header.
- Several accounts can share one email address. Find Accounts by Email returns up to 10 of them.
- Recurly returns amounts in the currency's main unit, such as 29.99 USD, so amounts are shown as Recurly sends them.
