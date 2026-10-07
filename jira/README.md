Connect Jira Cloud to help Captain check whether a bug or feature request is already tracked, read its status, comments, and release versions, and leave a comment for the team.

## Setup

1. Sign in to Atlassian as the user Captain should act as, and create an API token at [id.atlassian.com/manage-profile/security/api-tokens](https://id.atlassian.com/manage-profile/security/api-tokens). Create a token without scopes; scoped tokens use a different API address and do not work here.
2. Find your site subdomain. It is the first part of your Jira address, such as `acme` for `acme.atlassian.net`.
3. Enter the subdomain, the account's email address, and the API token when installing.

The token has the same access as the account. Use a dedicated account that has only the **Browse projects** permission on the projects Captain should see, plus **Add comments** if you want Captain to use Add Issue Comment.

## Tools

- **Search Issues:** Search issues by text. Returns the 10 most recently updated matches with type, status, priority, and assignee.
- **Get Issue:** Check one issue's status, resolution, priority, assignee, fix versions, components, labels, dates, and description (first 1,500 characters).
- **List Issue Comments:** Read the 10 most recent comments on an issue.
- **List Project Versions:** List a project's 15 latest released and unreleased versions with their release dates.
- **Add Issue Comment:** Add a comment to an issue, such as a note that another customer reported the same bug.

Start with Search Issues, then use the issue key, such as `PROJ-123`, with the other tools.

## Notes

- Jira Cloud only. Jira Data Center and custom domains are not supported.
- The tools use version 2 of the Jira REST API so that descriptions and comments are returned as plain text with wiki markup.
- Comments added to Jira Service Management requests through this API can be visible to the customer. Turn off Add Issue Comment after installing if that is a concern, or if Captain should only read from Jira.
- Search results can lag a few seconds behind recent changes.
