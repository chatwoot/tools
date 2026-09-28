Connect Attio to help Captain look up people, companies, and deals in your CRM, and log notes on them.

## Setup

A workspace admin can create an access token in Attio under **Workspace settings → Developers → New access token**. Give the token these scopes, then enter it when installing:

- **Records:** Read (`record_permission:read`)
- **Object configuration:** Read (`object_configuration:read`)
- **Notes:** Read (`note:read`), or Read-write (`note:read-write`) to use Add Note

## Tools

- **Find Person:** Find people by email address or phone number. Returns the person ID and company ID the other tools need.
- **Get Company:** Check a company's details, including custom fields such as plan, tier, or renewal date.
- **List Deals:** Check the 10 most recent deals linked to a person or company, with stage and value.
- **List Notes:** Read the 5 most recent notes on a person, company, or deal.
- **Add Note:** Add a plain-text note to a person, company, or deal, such as a conversation summary or a follow-up request.

Start with Find Person, then use the person or company ID with the other tools.

## Notes

- Find Person, Get Company, and List Deals return every field on the record, including custom fields, so Captain sees your workspace's own attributes. Owner and creator fields are left out because Attio returns them as member IDs, not names.
- List Deals needs the Deals object to be enabled in your workspace.
