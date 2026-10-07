Connect LaunchDarkly to help Captain check whether a feature flag is on, how it is targeted, and which variation a specific customer gets.

## Setup

1. In LaunchDarkly, open **Organization settings → Authorization** and create an access token. Use a service token with the **Reader** role, or a custom role limited to the project Captain should read.
2. Find your project key under **Project settings**, and the environment key under **Project settings → Environments**. Use the environment your customers are on, usually `production`.
3. Enter the access token, project key, and environment key when installing.

SDK keys, mobile keys, and client-side IDs do not work with these tools.

## Tools

- **Search Flags:** Find up to 20 flags by key or name, with whether each is on or off in the configured environment.
- **List Flags:** List flags in the project 20 at a time, with whether each is on or off in the configured environment.
- **Get Flag:** Check one flag's variations and its targeting in the configured environment: on or off, the default rule, percentage rollouts, the first 10 targeting rules, prerequisites, and how many contexts are individually targeted.
- **Get Flag Status:** Check whether a flag is new, active, inactive, or launched in each environment, and when it was last requested.
- **Find Context:** Find up to 5 contexts seen in the last 30 days by the start of their key, name, or email.
- **Evaluate Flag for Context:** Check which variation a context gets for a flag in the configured environment, and why.
- **List Environments:** List up to 20 environments in the project.

Start with Search Flags to get a flag key. To check a specific customer, use Find Context, then Evaluate Flag for Context.

## Notes

- All requests set `LD-API-Version: 20240415` and go to `app.launchdarkly.com`. Federal and EU instances are not supported.
- Evaluate Flag for Context sends only the context's key and kind. Rules that target other attributes, such as plan or country, are not matched, so the result can differ from what the customer's app receives.
- Evaluate Flag for Context and Find Context use POST requests but do not change any data. Evaluations made this way do not count toward flag statuses or insights.
- Environment SDK keys and mobile keys are never shown to Captain.
