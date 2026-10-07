Connect ClickUp to help Captain look through recent tasks for a known bug or feature request, read a task's status and latest comments, and leave a comment for the team.

## Setup

1. Sign in to ClickUp as the user Captain should act as. Click your avatar, open **Settings → Apps**, and generate a personal API token under **API Token**. It starts with `pk_`.
2. Find your Workspace ID. It is the number right after `app.clickup.com/` in the address bar when you have the Workspace open.
3. Enter the token and the Workspace ID when installing.

The token has the same access as the account, so Captain sees the tasks that user can see and comments are posted under their name. A dedicated member or guest account that is shared only on the relevant Spaces or Lists keeps access narrow.

## Tools

- **List Recent Tasks:** List the 30 most recently updated tasks in the Workspace, open and closed, with status and List.
- **List Tasks in List:** List the 30 most recently updated tasks in one List, such as a bug tracker, with status and assignees.
- **Get Task:** Check one task's status, priority, assignees, List, tags, dates, and description (first 1,500 characters).
- **List Task Comments:** Read the 10 most recent comments on a task.
- **Add Task Comment:** Add a plain-text comment to a task, such as a note that another customer reported the same bug.

Start with List Recent Tasks or List Tasks in List, then use the task ID with the other tools.

## Notes

- The ClickUp API has no text search for tasks, so Captain finds tasks by reading the recent task lists. Both list tools start at page 0; each page covers up to 100 tasks and shows the 30 most recently updated.
- Tasks are looked up by their ClickUp task ID, such as `86a1b2c3d`. Custom task IDs such as `DEV-123` are not supported.
- Add Task Comment notifies the task's assignees and watchers. Turn it off after installing if Captain should only read from ClickUp.
