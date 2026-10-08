Connect Resend to help Captain check the delivery status of sent emails, whether an address is suppressed or unsubscribed, and whether your sending domains are verified.

## Setup

In Resend, go to **API Keys → Create API Key** and choose **Full access**. A key with sending access only cannot read emails, suppressions, contacts, or domains. Enter the key when installing.

## Tools

- **List Recent Emails:** List the 50 most recent sent emails, with recipients, subject, and last delivery event. Returns the email ID that Get Email needs. Disabled by default because it shows Captain other recipients' addresses and subject lines; enable it only if that is acceptable.
- **Get Email:** Check one sent email's recipients, subject, and last delivery event, such as delivered, bounced, or complained.
- **Check Suppression:** Check whether an address is on the suppression list, and whether a bounce, spam complaint, or manual entry caused it.
- **List Suppressions:** List up to 10 addresses on the suppression list.
- **Get Contact:** Check whether a contact has unsubscribed from broadcast emails.
- **List Domains:** List up to 20 sending domains and whether each is verified.
- **Get Domain:** Check a sending domain's verification status and up to 15 of its DNS records.
- **Remove Suppression:** Remove an address from the suppression list so Resend sends to it again.

Start with Check Suppression for a customer who is not receiving emails. It returns the ID of the email that bounced or was reported, which Get Email accepts.

## Notes

- Resend's API cannot search sent emails by recipient. List Recent Emails only helps when the customer's email is among the last 50 sent, and it shows Captain other recipients' addresses and subject lines.
- Check Suppression and Get Contact return an error, not a "not found" message, when the address is not suppressed or has no contact.
- Resend only offers full access and sending access keys, so the key can also send email and change settings. Captain's tools only make the requests listed here.
- To stop Captain from changing the suppression list, disable Remove Suppression.
