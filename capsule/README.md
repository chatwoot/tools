Connect Capsule to help Captain look up people and organisations in your CRM, check their opportunities, projects, and history, and log notes on them.

## Setup

1. In Capsule, open **My Preferences > API Authentication Tokens** and create a personal access token.
2. Enter the token when installing.

The token acts as the user who created it, so Captain sees the same contacts, opportunities, and projects that user can see. Create it from a user with the narrowest access that covers the records Captain should read.

## Tools

- **Find Contacts:** Search people and organisations by email address, name, or phone number. Returns up to 5 matches with the party ID the other tools need.
- **Get Contact:** Check a person or organisation's details, including address, owner, tags, custom fields, and last contact date.
- **List Opportunities:** Check up to 10 opportunities linked to a contact, with milestone, value, and expected close date.
- **List Projects:** Check up to 10 projects linked to a contact, with status, stage, and expected close date.
- **List History:** Read up to 10 history entries for a contact: notes, logged emails, and completed tasks.
- **Add Note:** Add a plain-text note to a contact's history, such as a conversation summary or a follow-up request.

Start with Find Contacts, then use the party ID with the other tools.

## Notes

- Find Contacts uses Capsule's global search, so it returns the same matches as the search box in Capsule.
- People and organisations are both "parties" in Capsule. A person's organisation is shown with its own party ID, which works with every tool.
