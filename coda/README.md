Connect a Coda doc to help Captain read its pages and look up table rows to answer customer questions.

## Setup

1. Open your [account settings](https://docs.superhuman.com/account) in Coda (now Superhuman Docs), go to **API settings**, and generate an API token.
2. Add a restriction to the token so it has **read** access to only the doc Captain should use. An unrestricted token can read and change every doc your account can.
3. Find the doc ID. It is the part after `_d` in the doc's URL, such as `AbCDeFGH` in `/d/Help-Center_dAbCDeFGH`. The Doc ID Extractor in the [API reference](https://docs.superhuman.com/developers/apis/v1) also finds it from a doc URL.
4. Enter the doc ID and the token when installing.

## Tools

- **List Pages:** List up to 100 pages in the doc with their page IDs and parent pages.
- **Get Page Content:** Read a page as plain text. Reads the first 500 lines and cuts off after about 6,000 characters. Tables on the page are not included.
- **List Tables:** List up to 50 tables and views in the doc with their table IDs.
- **List Table Rows:** Read the first 20 visible rows of a table, in the order shown in the doc, with column names and values.
- **Find Table Rows:** Find up to 10 rows where a column exactly equals a text value, such as an order number or SKU.

Start with List Pages or List Tables, then read a page or look up rows.

## Notes

- Requests go to `https://docs.superhuman.com/apis/v1`, the base URL in the current API reference since Coda became Superhuman Docs. Existing Coda API tokens keep working.
- The API has no full-text search, so Captain finds answers by page and table names. Clear page titles help.
- Find Table Rows matches whole text values only. It does not search inside cells.
- Coda can take a few seconds to show recent edits through the API.
