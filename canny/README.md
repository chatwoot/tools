Connect Canny to help Captain find feature requests, check their status and latest updates, see what a customer asked or voted for, and add their vote to an existing request.

## Setup

1. Find your secret API key in your Canny company settings.
2. Enter the key when installing.

Canny API keys are not scoped, so the key gives full API access to your Canny workspace. Captain only uses it for the tools below.

## Tools

- **List Boards:** List up to 30 boards with their IDs and post counts.
- **Search Posts:** Search posts by keywords and get the 10 best matches with status, votes, and ETA. Can be narrowed to one board or to certain statuses.
- **Get Post:** Check one post's status, votes, ETA, category, tags, owner, and latest status update.
- **List Post Comments:** Read up to 10 of the most recent public comments on a post. Internal comments are left out.
- **Find User:** Find a Canny user by email address. Returns the Canny user ID the user tools need.
- **List User Posts:** List the 10 most recent posts a user created.
- **List User Votes:** List the 20 most recent posts a user voted for.
- **Add Vote:** Add a user's vote to an existing post.

Start with Search Posts for questions about a feature. For questions about a customer's own requests, start with Find User, then use the Canny user ID with the user tools.

## Notes

- Canny takes the API key in the request body, so every tool is a POST request, including the read-only ones.
- Add Vote is the only tool that changes data. It needs the customer to already exist in Canny, and voting twice has no extra effect. Disable the tool if Captain should not vote for customers.
- Post links returned by Canny point to the admin view, so they suit your team more than customers.
- Canny limits requests per API key by plan, starting at 5 requests per second and 1,000 per hour on the Free plan.
