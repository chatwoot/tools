Connect Freshdesk to help Captain look up contacts, tickets, ticket conversations, and solution articles, and leave private notes on tickets.

## Setup

1. Find your Freshdesk subdomain. If your helpdesk is at `acme.freshdesk.com`, the subdomain is `acme`.
2. Sign in to Freshdesk as the agent Captain should act as, click your profile picture, and open **Profile settings**. Copy the API key shown on that page.
3. Enter the subdomain and API key when installing.

The API key has the same access as the agent it belongs to. Use an agent whose role can view tickets, contacts, and solution articles, and can add notes if you want to use Add Private Note.

## Tools

- **Find Contact by Email:** Find a contact by email address. Returns the contact ID that List Contact Tickets needs.
- **List Contact Tickets:** Check a contact's 10 most recently created tickets, with status, priority, and type.
- **Get Ticket:** Check a ticket's status, priority, requester, due dates, tags, custom fields, and original description.
- **List Ticket Conversations:** Read the 10 most recent replies and notes on a ticket, newest first. Private notes are labeled so Captain keeps them internal.
- **Search Solution Articles:** Search the knowledge base by keyword. Returns up to 5 published articles with their text.
- **Add Private Note:** Add a private note to a ticket, such as a conversation summary. Private notes are never sent to the customer.

Start with Find Contact by Email, then use the contact ID to list tickets and a ticket ID with the other tools.

## Notes

- These tools use the Freshdesk API v2 on `<subdomain>.freshdesk.com`.
- List Ticket Conversations reads the first 50 replies and notes on a ticket. On longer tickets, it says that newer entries may be missing.
- Tickets with a custom status show the status number instead of its name, and agents and groups are shown by ID.
- Search Solution Articles returns article text but not a public link, because the Freshdesk search response does not include one.
- Each call counts toward your plan's Freshdesk API rate limit. Get Ticket uses extra credits because it also loads the requester and ticket stats.
