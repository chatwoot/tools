Connect Document360 to help Captain search your knowledge base articles, read them, and ask Eddy AI questions.

## Setup

1. In the Document360 portal, go to **Settings > Knowledge base portal > API tokens** and select **Create API token**.
2. Name the token and allow the **GET** method. Also allow **POST** if you want Captain to use Ask Eddy AI. Leave PUT and DELETE off.
3. When installing, enter the token and choose your **Document360 API host**: `apihub.us.document360.io` if your project is in the US data center, otherwise `apihub.document360.io`.

## Tools

- **List Workspaces:** List the project's workspaces with their workspace IDs and language codes. The other tools need these.
- **Search Articles:** Search a workspace by keywords. Returns up to 10 matching published articles with article IDs and excerpts.
- **Get Article:** Read the published version of an article as text, cut off after about 6,000 characters.
- **List Categories:** List a workspace's categories as an outline, up to three levels deep and 150 categories.
- **Get Category:** List up to 50 articles and the direct sub-categories inside a category.
- **Ask Eddy AI:** Ask Eddy AI a question and get an answer written from the workspace's articles, with up to 5 source articles.

Start with List Workspaces, then Search Articles or Ask Eddy AI, then Get Article to read the full text.

## Notes

- Ask Eddy AI uses your project's Eddy AI credits. When they run out, Captain is told to use Search Articles instead.
- The token is not limited to one workspace, so Captain can read every workspace in the project. Search Articles leaves out drafts, but List Categories and Get Category also show hidden items.
- Get Article returns Markdown for articles written in the Markdown editor. Articles written in the WYSIWYG editor are converted from HTML to plain text, and images are dropped.
- Projects on private hosting use a different API host and are not supported.
