Connect monday.com to help Captain find the item for a bug or request on your boards, check its status and updates, and post an update when another customer reports it.

## Setup

1. In monday.com, select your profile picture, then **Developers**, and under **API token** select **Show** and copy the token. Account admins can also find it under **Administration → Connections → Personal API token**.
2. Enter the token when installing.

A personal API token has the same access as the user who created it: Captain can read and update any board that user can. To limit what Captain sees, create the token from a user who only has access to the boards you want to share.

## Tools

- **List Boards:** List the 50 most recently used active boards with their board IDs.
- **Get Board:** Check a board's groups and its first 25 items.
- **Search Items:** Search one board for items whose name contains the given text. Returns up to 10 items.
- **Get Item:** Check one item's board, group, and column values such as status, owner, and dates.
- **List Item Updates:** Read the 10 most recent updates posted on an item.
- **Add Item Update:** Post an update on an item, such as a note that another customer reported the same issue.

Start with List Boards to get a board ID, then Search Items, then use the item ID with the other tools.

## Notes

- These tools use the monday.com GraphQL API and set `API-Version: 2026-07` for all requests.
- Search Items looks at item names on one board at a time; the API has no search across all boards.
- Get Item shows up to 30 columns that have a text value. Some column types, such as mirror and connect boards columns, have no text value and are left out.
- Add Item Update posts as the user who created the token.
