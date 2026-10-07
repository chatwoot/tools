Connect Netlify to help Captain check sites, recent deploys, and whether the latest production deploy succeeded.

## Setup

Create a personal access token in Netlify under Applications > Personal access tokens > New access token (https://app.netlify.com/user/applications#personal-access-tokens). Enter the token when installing.

## Tools

- **List Sites:** List sites with their URL and the state of the deploy that is currently live, 20 at a time.
- **Get Site:** Read one site's domains, repository, and the deploy that is currently live.
- **List Production Deploys:** List a site's 5 most recent production deploys with their state and any error.
- **List Site Deploys:** List a site's 10 most recent deploys across all contexts, including deploy previews and branch deploys.
- **List Failed Deploys:** List a site's 5 most recent failed deploys with their error messages.
- **Get Deploy:** Read one deploy's state, context, branch, commit, URLs, and error.

Start with List Sites, then use the site ID with the other tools. A site's domain, such as `example.netlify.app`, also works in place of the site ID. For List Sites, start with page 1.

## Notes

- These tools only read data.
- Responses include only the fields Captain needs. Site passwords, deploy hooks, and build settings other than the repository are never shown to Captain.
