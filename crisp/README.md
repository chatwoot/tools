Connect Crisp to help Captain look up contact profiles, conversations, and messages, and leave private notes on conversations.

## Setup

1. In Crisp, go to **Settings → Workspace Settings → Advanced configuration**. In the **API Token** section, click **Generate Token** and copy the identifier and key. They are only shown once, and only workspace owners can generate them.
2. Copy your website ID from **Settings → Workspace Settings → Setup Instructions**.
3. Enter the website ID, token identifier, and token key when installing.

## Tools

- **Search Conversations:** Search conversations by the customer's email address, name, or a keyword. Returns up to 10 conversations with the session ID the other tools need.
- **Get Contact Profile:** Check a contact's profile by email address, including company, location, segments, and the team's private notepad.
- **Get Conversation:** Check a conversation's state, visitor details, subject, segments, custom data, and assigned operator.
- **List Conversation Messages:** Read the 10 most recent messages in a conversation, newest first. Private notes are labeled so Captain keeps them internal.
- **Add Private Note:** Add a private note to a conversation, such as a summary of the chat. Notes are never sent to the customer.

Start with Search Conversations, then use a session ID with the conversation tools.

## Notes

- These tools use a Crisp website token and set `X-Crisp-Tier: website` for all requests. A website token works for one workspace and is limited to 10,000 requests per day.
- Get Contact Profile fails when no contact has that email address, because Crisp returns an error instead of an empty result.
- Assigned operators are shown by ID.
