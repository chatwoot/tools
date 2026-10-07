Connect Notion to help Captain find internal guides, policies, and tracker pages and read their content, properties, and comments.

## Setup

1. As a workspace owner, open the [Notion developer portal](https://app.notion.com/developers/connections), select **Internal connections**, and create a new connection for your workspace.
2. On the connection's **Configuration** tab, enable only the **Read content** capability, plus **Read comments** if you want Captain to use List Page Comments. Copy the API token from the same tab.
3. On the **Content access** tab, select the pages and databases Captain may read. Child pages are included automatically.
4. Enter the API token when installing.

Captain can only see content that is shared with the connection, so share just the knowledge base or tracker it needs.

## Tools

- **Search Pages:** Search pages and databases by title. Returns up to 10 matches with their IDs and links.
- **Get Page Content:** Read a page's text as Markdown, up to about 6,000 characters.
- **Get Page Properties:** Check a page's title, link, last edited date, and database properties such as status, tags, owner, or dates.
- **List Database Pages:** List the 20 most recently edited pages in a database, with each page's status and select properties.
- **List Page Comments:** Read the 10 most recent open comments on a page.

Start with Search Pages, then use the page ID or data source ID with the other tools.

## Notes

- Notion's search matches page and database titles only, not the text inside pages.
- The tools set `Notion-Version: 2026-03-11` for all requests. In this version a database's rows are read through its data source, so List Database Pages takes a data source ID, not a database ID.
- Get Page Content leaves out blocks Notion cannot render as Markdown, such as embeds and bookmarks, and child pages that are not shared with the connection.
- Get Page Properties does not show relation, rollup, or file properties.
