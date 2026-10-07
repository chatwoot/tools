Connect a GitHub repository to help Captain check whether a bug is already reported, read the discussion on an issue, and see which release includes a fix.

## Setup

1. In GitHub, go to **Settings > Developer settings > Personal access tokens > Fine-grained tokens** and generate a token.
2. Under repository access, select only the repository you want Captain to read.
3. Under repository permissions, set **Issues** to read-only and **Contents** to read-only. Contents is needed to read releases.
4. Enter the token, the repository owner, and the repository name when installing. For `github.com/acme/widgets`, the owner is `acme` and the name is `widgets`.

## Tools

- **Search Issues:** Search the repository's issues by keyword, state, or label. Shows the 10 best matches.
- **Get Issue:** Read one issue by number, with its state, labels, assignees, milestone, and description.
- **List Issue Comments:** Read the 5 newest comments on an issue.
- **List Releases:** Check the 5 newest releases with their release notes.
- **Get Latest Release:** Check the latest stable release and its release notes.

## Notes

- These tools set `X-GitHub-Api-Version: 2026-03-10` for all requests.
- One installation covers one repository.
- Search Issues returns issues only, not pull requests. GitHub limits search to 30 requests per minute.
- List Issue Comments reads the first 100 comments on an issue, so on longer threads the newest comments can be missing.
- For a private repository, Captain can share issue text and release notes with customers. Check that this is acceptable before connecting it.
