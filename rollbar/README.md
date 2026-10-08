Connect Rollbar to help Captain check which errors are active, search known errors, and see recent occurrences and deploys.

## Setup

1. In Rollbar, open the settings of the project you want to connect and go to its project access tokens.
2. Create a token with only the `read` scope, or copy an existing `read` token.
3. Enter the token when installing.

A project access token reads one project. Connect the project your customers use in production.

## Tools

- **List Top Active Items:** List the 10 most severe and frequent errors from the last 24 hours.
- **List Active Items:** List up to 15 unresolved items with error or critical level in one environment.
- **Search Items:** Search items by error title across all statuses and environments. Returns up to 15 matches.
- **Get Item:** Check one item's status, level, environment, occurrence count, and first and last seen times.
- **List Item Occurrences:** See the 5 most recent occurrences of an item with the error message, environment, code version, request URL, and host.
- **List Deploys:** List the 10 most recent deploys with environment, revision, and status.

Start with List Top Active Items or Search Items, then use the item ID with Get Item and List Item Occurrences.

## Notes

- Tools take the item ID returned by the list tools, not the `#` counter shown in Rollbar URLs.
- Account access tokens are not supported, because they need a project ID on every request.
- Occurrence details leave out person data, request headers, and request parameters.
