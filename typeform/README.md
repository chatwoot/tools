Connect Typeform to help Captain find your forms and look up what a customer submitted.

## Setup

1. In Typeform, open **Account → Personal tokens** and generate a new token with these scopes:
   - **Forms:** Read (`forms:read`)
   - **Responses:** Read (`responses:read`)
2. Choose the API host for your account. Most accounts use `api.typeform.com`. Accounts that store responses in the EU data center use `api.eu.typeform.com` or `api.typeform.eu`.
3. Enter the token and API host when installing.

## Tools

- **List Forms:** List the 20 most recently updated forms with their IDs and links. Can be narrowed by text in the title.
- **Get Form:** Check a form's title, link, and up to 60 questions with their field IDs.
- **Search Responses:** Find the 10 most recent completed responses that contain an exact phrase, such as an email address, in an answer, hidden field, or variable.
- **List Responses:** List the 10 most recent completed responses to a form with their answers.
- **Get Response:** Read one response in full, with every answer and hidden field.

Start with List Forms to get a form ID, then use Search Responses with the customer's email address.

## Notes

- Responses show each answer with its question type and field ID. Captain uses Get Form to match field IDs to question titles.
- Only completed responses are returned. Typeform can take up to 30 minutes to return a new response.
- Typeform allows two requests per second per account.
