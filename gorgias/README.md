Connect Gorgias to help Captain look up customers, their orders, tickets, and ticket messages, and leave internal notes on tickets.

## Setup

1. Find your Gorgias subdomain. If your helpdesk is at `acme.gorgias.com`, the subdomain is `acme`.
2. Sign in to Gorgias as the user Captain should act as, go to **Settings → REST API**, and click **Create API key**.
3. Enter the subdomain, that user's email address, and the API key when installing.

The API key has the same permissions as the user it belongs to. Use a user whose role can view customers and tickets, and can reply to tickets if you want to use Add Internal Note.

## Tools

- **Find Customer by Email:** Find a customer by their primary email address. Returns the customer ID the other tools need.
- **Get Customer:** Check a customer's profile, internal note, and data synced from integrations such as Shopify, including their 5 most recent orders.
- **List Customer Tickets:** Check a customer's 10 most recently created tickets, with status, channel, assignee, tags, and a preview of the last message.
- **Get Ticket:** Check a ticket's status, customer, assignee, tags, summary, and satisfaction score.
- **List Ticket Messages:** Read the 10 most recent messages on a ticket, newest first. Internal notes are labeled so Captain keeps them internal.
- **Add Internal Note:** Add an internal note to a ticket, such as a conversation summary. Internal notes are never sent to the customer.

Start with Find Customer by Email, then use the customer ID to list tickets and a ticket ID with the other tools.

## Notes

- Gorgias API keys are meant for accessing your own Gorgias account. Internal notes are posted as the user whose email address you entered.
- Order details in Get Customer come from the raw data your store integration syncs to Gorgias, so the fields shown depend on the integration.
- Gorgias archives the full body of email messages 30 days after they are sent or received. List Ticket Messages shows the text without signatures and quoted replies when Gorgias has it, and says so when no text is available.
