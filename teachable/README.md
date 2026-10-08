Connect a Teachable school to help Captain look up students, their course enrollments and progress, and their purchases.

## Setup

1. In your Teachable school admin, go to **Settings → API** and click **Create API Key**.
2. Give the key a name, create it, and enter it when installing.

Teachable API keys give access to the whole school; there are no per-key scopes. Captain only uses the read endpoints listed below.

## Tools

- **Find User by Email:** Find a student by email address. Returns the user ID the other tools need.
- **Get User Enrollments:** Check a student's role, tags, and up to 25 enrolled courses, with enrollment status, percent complete, and enrollment and completion dates.
- **Get Course Progress:** Check a student's progress in one course, section by section (first 30 sections), with completion date and certificate serial number.
- **List Transactions:** Check 10 of a student's sales transactions, with listed price, amount charged, payment status, refunds, and chargebacks.
- **Get Pricing Plan:** Check a pricing plan's name, price, billing interval, free trial, and access limits, and the course it belongs to.
- **Find Courses:** Find up to 10 courses by name, with course ID and published status.

Start with Find User by Email, then use the user ID with the other tools.

## Notes

- The Teachable API is only available on paid Teachable plans that include API access.
- Amounts are shown as Teachable returns them, in the smallest currency unit (for example cents). The amount charged is calculated in USD by default, so it can differ from the listed price.
- Get User Enrollments and Get Course Progress cover courses only. Teachable's API does not return coaching, digital download, or community purchases there; use List Transactions for those sales.
- New transactions can take up to two minutes to appear.
