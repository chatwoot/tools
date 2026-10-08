Connect Todoist to help Captain find the task for a bug or request, check its details and comments, and add a comment when another customer reports it.

## Setup

1. In Todoist, go to **Settings → Integrations → Developer** and copy your API token.
2. Enter the token when installing.

A personal API token has full access to the Todoist account it belongs to and cannot be scoped. Use an account that only holds the projects you want Captain to see.

## Tools

- **Search Tasks:** Search active tasks by keyword. Returns up to 10 tasks with priority, due date, labels, and task ID.
- **Get Task:** Check one active task's description, priority, due date, labels, and comment count.
- **List Task Comments:** Read up to 10 comments on a task, newest first.
- **List Projects:** List up to 50 active projects with their project IDs.
- **List Project Tasks:** List up to 25 active tasks in a project.
- **Add Task Comment:** Add a comment to a task, such as a note that another customer reported the same issue.

Start with Search Tasks, then use the task ID with the other tools.

## Notes

- These tools use the unified Todoist API v1 (`https://api.todoist.com/api/v1`).
- Completed tasks are not returned by Search Tasks, Get Task, or List Project Tasks.
- Tasks show their project as an ID; use List Projects to match it to a name.
- Priority runs from 1 (normal) to 4 (urgent). Todoist's apps show priority 4 as "P1".
- Add Task Comment posts as the account the token belongs to.
