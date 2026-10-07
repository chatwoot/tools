Connect GitBook to help Captain search your docs, read pages, and ask GitBook AI questions about your content.

## Setup

1. Pick the GitBook account Captain should act as. A token has the same access as the account that created it, so use an account that can only read the spaces Captain needs.
2. Signed in as that account, open [Developer settings](https://app.gitbook.com/account/developer) and create a personal access token.
3. Find your organization ID. It is the `id` returned by `GET https://api.gitbook.com/v1/orgs` when called with the token.
4. Enter the organization ID and the token when installing.

## Tools

- **Search Content:** Search every space in the organization by keywords. Returns up to 10 matching pages with excerpts, space IDs, and page IDs.
- **Ask Question:** Ask GitBook AI a question and get an answer written from the organization's docs, with up to 5 source pages.
- **List Spaces:** List up to 50 spaces in the organization with their space IDs and published URLs.
- **List Pages:** List a space's pages as an outline, up to three levels deep and 150 pages.
- **Get Page:** Read a page's title and content as Markdown, cut off after about 6,000 characters.
- **Search Space:** Search one space by keywords. Returns the 10 best matching pages with excerpts.

Start with Search Content or Ask Question, then use the space ID and page ID with Get Page to read the full page.

## Notes

- Ask Question needs GitBook AI to be enabled for your organization. Slow answers can exceed Captain's 20-second limit, in which case Captain falls back to Search Content.
- The tools read each space's current content, which can include spaces that are not published. Limit the account's access if Captain should only see public docs.
- Links in results open the page in the GitBook app, not on your published site.
