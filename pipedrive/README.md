Connect Pipedrive to help Captain look up people and their deals, notes, and activities in your CRM.

## Setup

Copy your API token from Pipedrive under **Company settings → Personal preferences → API** and enter it when installing. The token has the same access as the user it belongs to, so use a user who can only see the people and deals Captain should see.

## Tools

- **Find Person by Email:** Find up to 5 people by exact email address. Returns the person ID the other tools need.
- **List Person Deals:** Check the 10 most recently updated deals linked to a person, with status, value, stage ID, and won or lost details.
- **List Stages:** List up to 100 deal stages with their names and pipeline IDs.
- **List Person Notes:** Read the 5 most recent notes on a person.
- **List Person Activities:** Check a person's 10 most recent or upcoming activities, such as calls, meetings, and tasks, and whether they are done.

Start with Find Person by Email, then use the person ID with the other tools.

## Notes

- Pipedrive returns deal stages as IDs. Captain calls List Stages to turn them into names.
- List Person Activities only returns activities where the person is the primary participant.
- Archived and deleted deals are left out.
- List Person Notes uses Pipedrive's v1 notes endpoint. The other tools use API v2.
