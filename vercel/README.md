Connect Vercel to help Captain check projects, recent deployments, and whether the latest production deployment succeeded.

## Setup

Create an access token on the Account Tokens page in Vercel (https://vercel.com/account/tokens). Under Scope, select the team whose projects Captain should check, or a single project within it, rather than Full Account. Enter the token when installing.

## Tools

- **List Projects:** List up to 20 projects with the state of each one's current production deployment.
- **Get Project:** Read one project's repository, production deployment, production domains, and 5 latest deployments.
- **Get Latest Production Deployment:** Check whether a project's most recent production deployment succeeded, failed, or is still building.
- **List Project Deployments:** List a project's 10 most recent deployments, production and preview, with their state and any error.
- **List Recent Deployments:** List the 10 most recent deployments across all projects the token can access.
- **Get Deployment:** Read one deployment's state, environment, Git branch and commit, domains, and error.
- **List Project Domains:** List up to 20 domains attached to a project and whether each is verified.

Start with List Projects, then use the project name or ID with the other tools.

## Notes

- These tools do not send a team ID. A token scoped to a team or project works as is. A Full Account token only reaches projects in your personal account.
- With a project-scoped token, Vercel denies requests for team-level resources and other projects, so the tools only return data for that project.
- Vercel access tokens always allow writes within their scope. These tools only read data.
- Times are shown in the time zone of the Chatwoot server, with the zone abbreviation next to each time.
