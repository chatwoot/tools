Connect Slite to help Captain search your notes, read them, and ask Slite's AI questions about your knowledge base.

## Setup

1. In Slite, open the organization menu at the top left and go to **Settings > API**.
2. Select **Create a new key** and copy it. Slite shows the key only once.
3. Enter the key when installing.

The key acts as the user who created it, and Captain can read every note that user can. Create it from an account that only has access to the channels Captain should use.

## Tools

- **Search Notes:** Search notes by keywords. Returns the 10 best matches with note IDs, parent notes, and matching excerpts.
- **Get Note:** Read a note's title and content as Markdown, cut off after about 6,000 characters.
- **List Notes:** List the 30 most recently edited notes the API key can access.
- **List Child Notes:** List up to 50 notes directly under a note or channel, in sidebar order.
- **Ask Question:** Ask Slite's AI a question and get an answer written from your notes, with the source notes.

Start with Search Notes or Ask Question, then use a note ID with Get Note to read the full text.

## Notes

- Ask Question needs Slite's Ask feature to be enabled for your workspace, and Slite rate-limits it.
- Slite can take longer to answer than Captain waits. Captain stops waiting after 20 seconds, so a slow Ask Question call fails and Captain falls back to Search Notes.
- Search Notes does not include archived notes.
