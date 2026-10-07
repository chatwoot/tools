Connect Affinity to help Captain look up people and companies in your CRM, see the lists they are on, read notes, and log new notes.

## Setup

1. In Affinity, open **Settings > Manage Apps** and generate an API key. You need the "Generate an API key" permission, which your Affinity admin controls.
2. Make sure the user who owns the key also has these permissions:
   - **Export All People directory**, for Find People
   - **Export All Organizations directory**, for Find Companies
3. Enter the API key when installing.

The key acts as its owner, so Captain sees only the lists, notes, and records that user can see in Affinity.

## Tools

- **Find People:** Search people by email address or name. Returns up to 5 matches with the person ID the other tools need.
- **Get Person:** Check a person's profile, including enriched, custom, and relationship fields such as job title, location, and current company.
- **Find Companies:** Search companies by name or domain. Returns up to 5 matches with the company ID.
- **Get Company:** Check a company's profile, including enriched, custom, and relationship fields.
- **List Person Lists:** Check up to 10 lists a person is on, with list-specific fields such as status.
- **List Person Notes:** Read up to 5 notes about a person, newest first.
- **List Company Notes:** Read up to 5 notes about a company, newest first.
- **Add Note:** Add a plain-text note to a person or company, such as a conversation summary or a follow-up request.

Start with Find People or Find Companies, then use the returned ID with the other tools.

## Notes

- These tools use Affinity API v2 and send `X-Affinity-Api-Version: 2026-09-17` with every request.
- Find People and Find Companies use search endpoints that Affinity marks as beta, so their behavior may change. Search terms must be at least 3 characters.
- The notes tools read up to 50 notes per record and show the 5 newest.
- The Affinity API is only available on some Affinity plans.
