Connect Trello to help Captain find the card for a bug or request, check its status and comments, and add a comment when another customer reports it.

## Setup

1. Go to [trello.com/apps/admin](https://trello.com/apps/admin), open (or create) a Power-Up, and under the **Trello Auth** tab select **Generate a new API Key**. Copy the API key.
2. Generate a token for the Trello account Captain should act as by visiting this URL while signed in to that account, replacing `YOUR_API_KEY`, and selecting **Allow**:

   `https://trello.com/1/authorize?expiration=never&scope=read,write&response_type=token&key=YOUR_API_KEY`

   Use `scope=read` instead if you don't need Add Card Comment.
3. Enter the API key and the token when installing.

The token can see every board the Trello account can see. To limit what Captain reads, create the token from an account that is only a member of the boards you want to share.

## Tools

- **Search Cards:** Search cards by keyword across every board the account can see. Returns up to 10 cards with their board, list, due date, and card ID.
- **Get Card:** Check one card's board, list, due date, labels, members, checklist progress, comment count, and description.
- **List Card Comments:** Read the 10 most recent comments on a card.
- **List Boards:** List up to 50 open boards with their board IDs.
- **List Board Cards:** List the open lists on a board and the open cards in each, up to 20 lists and 10 cards per list.
- **Add Card Comment:** Add a comment to a card, such as a note that another customer reported the same issue.

Start with Search Cards, then use the card ID with the other tools.

## Notes

- The API key and token are sent in Trello's `Authorization: OAuth` header, not in the request URL.
- Search matches whole words and word prefixes, so "dev" finds "development" but "velopment" does not.
- Add Card Comment posts as the Trello account that created the token.
