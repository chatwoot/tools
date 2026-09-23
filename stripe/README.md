# Stripe

Connect Stripe to help Captain check customer payments, invoices, and subscriptions.

## Setup

Create a Stripe restricted API key with read access to Customers, Payment Intents, Invoices, and Subscriptions. Enter the key when installing this toolset.

## Tools

- **Find Customers by Email:** Find a Stripe customer ID using an exact email address.
- **Get Customer:** Check a customer by ID.
- **List Payments:** Check a customer's 20 most recent payment attempts.
- **Get Payment:** Check one payment attempt by ID.
- **List Invoices:** Check a customer's 20 most recent invoices.
- **Get Invoice:** Check one invoice by ID.
- **List Subscriptions:** Check up to 20 subscriptions, including canceled ones.
- **Get Subscription:** Check one subscription by ID.

Use the customer ID from Find Customers by Email with the list tools.
