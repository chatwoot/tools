Connect Shortcut to help Captain find the story for a bug or feature request, check its progress and comments, and add a comment when another customer reports it.

## Setup

1. In Shortcut, go to **Settings → API Tokens** ([app.shortcut.com/settings/account/api-tokens](https://app.shortcut.com/settings/account/api-tokens)) and generate a token.
2. Enter the token when installing.

A Shortcut API token has the same access as the user who created it and cannot be scoped. Create it from a user with the least access that still covers the stories Captain should see.

## Tools

- **Search Stories:** Search stories by keyword or Shortcut search operators. Returns up to 10 stories with type, progress, and story ID.
- **Get Story:** Check one story's type, progress, workflow state, deadline, labels, tasks, and description.
- **List Story Comments:** Read the 10 most recent comments on a story.
- **Search Epics:** Search epics by keyword. Returns up to 10 epics with story counts.
- **List Workflow States:** List each workflow's states with their IDs, to turn a story's workflow state ID into a name.
- **Add Story Comment:** Add a comment to a story, such as a note that another customer reported the same issue.

Start with Search Stories, then use the story ID with the other tools.

## Notes

- Stories report their workflow state as an ID. Captain sees whether a story is not started, in progress, or done, and can call List Workflow States for the exact state name.
- Comments show their date and text. Shortcut returns comment authors as member IDs, not names, so they are left out.
- Add Story Comment posts as the user who created the token.
- Shortcut limits API requests to 200 per minute.
