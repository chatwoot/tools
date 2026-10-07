Connect Asana to help Captain check whether a bug or feature request is already tracked as a task, read its status and latest comments, and leave a comment for the team.

## Setup

1. Sign in to Asana as the user Captain should act as, open the [developer console](https://app.asana.com/0/my-apps), and create a personal access token.
2. Find your workspace GID. While signed in, open [app.asana.com/api/1.0/workspaces](https://app.asana.com/api/1.0/workspaces) in your browser and copy the `gid` of the workspace or organization.
3. Enter the token and the workspace GID when installing.

The token has the same access as the account, so Captain sees the tasks that user can see and comments are posted under their name. A dedicated account that is a member of only the relevant projects keeps access narrow.

## Tools

- **Search Tasks:** Search tasks by text in the name and description. Returns up to 10 matches by relevance with completion status, assignee, and project.
- **Find Tasks by Name:** Find up to 10 tasks whose name matches, using Asana's typeahead search.
- **Get Task:** Check one task's completion status, assignee, project and section, due date, tags, custom fields, and description (first 1,500 characters).
- **List Task Comments:** Read the 10 most recent comments on a task.
- **Add Task Comment:** Add a plain-text comment to a task, such as a note that another customer reported the same bug.

Start with Search Tasks or Find Tasks by Name, then use the task GID with the other tools.

## Notes

- Search Tasks needs a paid Asana plan; Asana rejects it on free workspaces. Find Tasks by Name works on every plan, but it only matches task names and is not exhaustive.
- New and changed tasks can take up to a minute to appear in Search Tasks.
- Turn off Add Task Comment after installing if Captain should only read from Asana.
