Connect Confluence Cloud to help Captain search your pages and read them to answer customer questions.

## Setup

1. Pick the Atlassian account Captain should act as. Captain can read every page that account can view, so a dedicated account with view-only access to your help or knowledge base spaces is the safest choice.
2. Signed in as that account, open [API tokens](https://id.atlassian.com/manage-profile/security/api-tokens) and select **Create API token**. Use a regular token, not **Create API token with scopes**; Atlassian requires scoped tokens to be used through `api.atlassian.com`, not your site URL, so they do not work with this integration.
3. When installing, enter:
   - **Confluence site subdomain:** the part before `.atlassian.net` in your Confluence URL, such as `acme` for `acme.atlassian.net`.
   - **Atlassian account email:** the email address of the account that created the token.
   - **Atlassian API token:** the token you created.

## Tools

- **Search Pages:** Search pages by keywords across every space the account can view. Returns the 10 best matches with page IDs, space names, and excerpts.
- **Get Page:** Read a page's title and text. The page is converted from HTML to plain text and cut off after about 6,000 characters.
- **List Spaces:** List up to 50 current spaces with their space IDs, keys, and home page IDs.
- **List Pages in Space:** List up to 50 top-level pages in a space, sorted by title.
- **List Child Pages:** List up to 50 items directly under a page, in sidebar order.

Start with Search Pages, then use the page ID with Get Page. Use the list tools to browse a space when a search finds nothing.

## Notes

- This integration works with Confluence Cloud sites on `atlassian.net`. Confluence Data Center and custom domains are not supported.
- Atlassian API tokens expire after at most one year. Create a new token and update the integration before the old one expires.
- Search Pages uses the CQL search endpoint of the v1 REST API (`text ~ "keywords"`, pages only). The other tools use the v2 REST API.
- Get Page drops images, macros, and attachments. Tables are flattened to text.
- List Child Pages also returns folders, whiteboards, databases, and Smart Links. Only items of type page can be read with Get Page.
