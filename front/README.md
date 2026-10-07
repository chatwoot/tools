Connect Front to help Captain look up contacts, conversations, messages, and internal comments, and leave comments on conversations.

## Setup

1. In Front, go to **Settings → Developers**, open the **API Tokens** tab, and click **Create API token**.
2. Choose the **Access resources** feature, the namespaces that hold the inboxes Captain should see (usually **Shared resources**), and these permissions:
   - `contacts:read`
   - `conversations:read`
   - `messages:read`
   - `comments:read`
   - `comments:write`, only if you want to use Add Comment
3. Enter the token when installing.

## Tools

- **Find Contact by Email:** Find a contact by email address. Returns the contact ID that List Contact Conversations needs.
- **List Contact Conversations:** Check a contact's 10 most recent conversations, with status, assignee, and tags.
- **Search Conversations:** Search conversations by keyword or Front search filters such as `from:` and `is:open`. Returns up to 10 conversations, most recently active first.
- **Get Conversation:** Check a conversation's status, assignee, main contact, tags, links, and custom fields.
- **List Conversation Messages:** Read the 10 most recent messages in a conversation, newest first.
- **List Conversation Comments:** Read the 10 most recent internal comments on a conversation, newest first.
- **Add Comment:** Add an internal comment to a conversation, such as a summary of the chat. Comments are never sent to the customer.

Start with Find Contact by Email, then use the contact ID to list conversations and a conversation ID with the other tools.

## Notes

- Find Contact by Email fails when no contact has that email address, because Front returns an error instead of an empty result. Captain can fall back to Search Conversations with `from:` and the email address.
- Search Conversations is limited by Front to 40% of your company's API rate limit.
- Conversations in private inboxes are only visible if the token includes private resources and the teammate has turned on API access.
- The Front API has no search for knowledge base articles, so this integration does not include one.
