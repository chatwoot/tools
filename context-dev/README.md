# Context.dev

Connect Context.dev to help Captain search the web, research questions, and look up people.

## Setup

Create a Context.dev API key on the [API keys](https://context.dev/dashboard/api-keys) page and enter it when installing. A Restricted key with only the **Data APIs: Use** permission (`data:execute`) is enough.

## Tools

- **Search Web:** Search the web and get the top 10 results with titles, links, and snippets. Supports operators such as `site:` and quoted phrases. Costs 1 credit.
- **Research Question:** Research a question on the live web and get a short answer with up to 5 sources. Costs 10 credits.
- **Enrich Person:** Look up a person's profile, current role, and up to 5 past roles from a work email, a profile URL such as LinkedIn, or a first and last name with their company. Costs 20 credits per match and needs a paid Context.dev plan.

## Notes

- Research Question always uses Context.dev's `fast` mode and asks for a single `answer` field, so Captain only has to send the question.
- Each request asks Context.dev to return partial results before Captain's 20-second limit. When research stops early, the answer says it may be incomplete.
- Enrich Person rejects personal and disposable email addresses such as Gmail. Use a profile URL or name and company instead.
