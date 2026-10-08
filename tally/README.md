Connect Tally to help Captain find your forms and look up what a customer submitted.

## Setup

1. In Tally, go to **Settings → API keys** and create an API key.
2. Enter the key when installing.

A Tally API key is tied to the user who created it and can access everything that user can, so create it from an account limited to the workspaces Captain should read.

## Tools

- **List Forms:** List forms with their IDs, status, and submission counts, 50 per page.
- **Get Form:** Check a form's name, status, submission count, submission limit, and closing date.
- **List Form Questions:** List up to 80 questions on a form with their types.
- **List Submissions:** List submissions to a form, newest first, 20 per page, with their answers.
- **List Submissions by Date:** List up to 20 submissions a form received between two dates, with their answers.
- **Get Submission:** Read one submission in full, with every answer.

Start with List Forms to get a form ID. The Tally API cannot search submissions by person, so Captain lists submissions, narrowed by date when the customer knows it, and matches the customer's email or name in the answers.

## Notes

- Submission lists show up to 12 answers each, with long answers shortened. Use Get Submission for the full text.
- Completed and partial submissions are both listed, and each one is labelled.
- Dates for List Submissions by Date are in UTC.
- Tally allows 100 requests per minute.
