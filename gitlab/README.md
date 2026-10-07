Connect a GitLab project to help Captain look up known issues, open incidents, linked merge requests, and releases.

## Setup

1. In your GitLab project, go to Settings > Access tokens and create a project access token with the Reporter role and only the `read_api` scope. A personal or group access token with `read_api` also works.
2. Find the numeric project ID on the project overview page.
3. When installing, enter the token, the project ID, and your GitLab host without `https://`. Use `gitlab.com` unless you run a GitLab Self-Managed or GitLab Dedicated instance.

## Tools

- **List Open Incidents:** List the 10 most recently created open incidents with severity and labels.
- **Search Issues:** Search open and closed issues by words in the title or description. Returns the 10 most recently updated matches.
- **Get Issue:** Read one issue or incident with its state, labels, milestone, assignees, and the first 800 characters of its description.
- **List Issue Comments:** Read the 10 most recent comments on an issue. System activity and internal notes are left out.
- **List Issue Merge Requests:** List up to 10 merge requests related to an issue, with their state.
- **List Releases:** List the 5 latest releases with their release notes.

Start with Search Issues or List Open Incidents, then use the issue number with the other tools.

## Notes

- All tools read from the one project entered at install.
- List Open Incidents and Search Issues leave out confidential issues. Get Issue can still open a confidential issue by number if the token has access, and tells Captain not to share it.
- A self-managed GitLab host must be reachable from Chatwoot over HTTPS.
