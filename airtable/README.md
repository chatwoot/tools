Connect an Airtable base to help Captain search one table, read records, and read or add record comments.

## Setup

1. Create a personal access token at https://airtable.com/create/tokens. Add the scopes `data.records:read`, `data.recordComments:read`, and `data.recordComments:write`, and give it access to only the base Captain should read. Leave out `data.recordComments:write` if you plan to turn off Add Record Comment.
2. Find the base ID and table ID. Open the table in Airtable; in the URL `https://airtable.com/appXXXXXXXXXXXXXX/tblXXXXXXXXXXXXXX/...`, the part starting with `app` is the base ID and the part starting with `tbl` is the table ID.
3. Choose the field Captain searches, such as `Email` or `Order number`, and enter its exact name or its field ID.
4. Enter the token, base ID, table ID, and search field when installing.

## Tools

- **Search Records:** Find up to 5 records whose search field contains the given text, ignoring case. Shows the first 15 fields of each record and the record ID the other tools need.
- **Find Records by Field:** Find up to 5 records where a named field exactly equals a value, ignoring case.
- **Get Record:** Read up to 40 fields of one record by record ID.
- **List Record Comments:** Read the 10 most recent comments on a record.
- **Add Record Comment:** Add a plain text comment to a record. The comment is posted as the user who owns the token.

Start with Search Records, then use the record ID with the other tools.

## Notes

- Each install covers one table. To search several fields at once, add a formula field that joins them, such as `{Name} & " " & {Email}`, and use it as the search field.
- Use the table ID rather than the table name, so renaming the table does not break the tools.
- Field values are returned as display text in UTC with the `en` locale. Airtable leaves empty fields out of results.
- Captain can read every field in the table, so keep sensitive fields in a different table.
