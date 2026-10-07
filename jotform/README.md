Connect Jotform to help Captain find your forms and look up what a customer submitted.

## Setup

1. In Jotform, go to **My Account → API** and create a new API key. These tools only read data.
2. Choose the API host for your account: `api.jotform.com` for most accounts, `eu-api.jotform.com` for accounts hosted in the EU, or `hipaa-api.jotform.com` for HIPAA accounts.
3. Enter the API key and API host when installing.

## Tools

- **List Forms:** List forms with their IDs, status, and submission counts, 20 at a time.
- **Get Form:** Check a form's title, status, link, submission counts, and last submission time.
- **List Form Questions:** List up to 80 questions on a form with their labels and types.
- **Search Submissions:** Find up to 10 submissions across all forms that contain a word or phrase, such as an email address.
- **List Form Submissions:** List up to 10 submissions to one form with their answers.
- **Get Submission:** Read one submission in full, with every answer.

Start with Search Submissions when you have the customer's email address. For List Forms, start with offset 0 and add 20 to read the next group.

## Notes

- Submission lists show up to 15 answered questions each, with long answers shortened. Use Get Submission for the full text.
- Jotform Enterprise accounts that use their own API domain are not supported.
- Jotform limits API calls per day by plan, starting at 1,000 calls per day on the Starter plan.
