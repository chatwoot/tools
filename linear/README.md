Connect Linear to help Captain check whether a bug or feature request is already tracked, read its status and latest comments, and leave a comment for the team.

## Setup

1. In Linear, open **Settings → Account → Security & access** and create a personal API key.
2. Give the key **Read** access, plus **Create comments** if you want Captain to use Add Issue Comment. If you can, limit the key to the teams Captain should see.
3. Enter the API key when installing.

The key acts as the Linear user who created it, so Captain sees the issues that user can see and comments are posted under their name. A dedicated member account for Captain keeps this clear.

## Tools

- **Search Issues:** Search issues by text. Returns up to 10 matches by relevance, with status, priority, team, and assignee.
- **Get Issue:** Check one issue's status, priority, assignee, project, labels, dates, and description (first 1,500 characters).
- **List Issue Comments:** Read the 10 most recent comments on an issue.
- **Search Projects:** Search projects by text. Returns up to 5 matches with status, progress, health, lead, and start and target dates.
- **Add Issue Comment:** Add a Markdown comment to an issue, such as a note that another customer reported the same bug.

Start with Search Issues, then use the issue identifier, such as `ENG-123`, with the other tools.

## Notes

- Linear's search endpoints are limited to 30 requests per minute.
- List Issue Comments reads up to 50 comments from Linear and shows the 10 newest.
- Turn off Add Issue Comment after installing if Captain should only read from Linear.
