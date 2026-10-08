Connect Wrike to help Captain find the task for a bug or request, check its status and comments, and add a comment when another customer reports it.

## Setup

1. In Wrike, open **Apps & Integrations → API** (the [App Console](https://www.wrike.com/appconsole.htm?#/api)), create an app, and select **Get token** to create a permanent access token. Copy it right away; Wrike shows it only once.
2. Find your API host: it matches the address in your browser when you use Wrike, one of `www.wrike.com`, `app-eu.wrike.com`, or `app-us2.wrike.com`.
3. Enter the token and select the host when installing.

A permanent token has the same access as the user who created it and cannot be scoped. Create it from a user who only has access to the spaces you want Captain to see.

## Tools

- **Search Tasks:** Search tasks whose title contains the given text. Returns the 10 most recently updated matches with status, importance, due date, and task ID.
- **Find Task by Permalink:** Find a task from its Wrike link, when you have a link instead of a task ID.
- **Get Task:** Check one task's status, importance, dates, and description.
- **List Task Comments:** Read the 10 most recent comments on a task.
- **Find Folders and Projects:** Find folders and projects by title, with project status and dates. Returns up to 20 matches.
- **List Folder Tasks:** List the 20 most recently updated tasks in a folder or project, including its subfolders.
- **List Statuses:** List account-wide workflows and the name of each custom status ID.
- **Add Task Comment:** Add a plain-text comment to a task, such as a note that another customer reported the same issue.

Start with Search Tasks or Find Task by Permalink, then use the task ID with the other tools.

## Notes

- Wrike task IDs used by the API, such as `IEAAAAAQKQAB5FKP`, are different from the number in a task link. Use Find Task by Permalink to get the API ID from a link.
- Requests sent to the wrong host fail, so the host must match your Wrike account's data center.
- Tasks report custom statuses as IDs; List Statuses maps them to names. Workflows that belong to a single space are not listed.
- Comments show their date and text. Wrike returns comment authors as user IDs, not names, so they are left out.
- Add Task Comment posts as the user who created the token.
