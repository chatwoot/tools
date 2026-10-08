Connect SendGrid to help Captain check whether an email was delivered, why it bounced or was dropped, and whether an address is on a suppression list.

## Setup

1. In SendGrid, go to **Settings → API Keys → Create API Key** and choose **Custom Access**.
2. Give the key these permissions:
   - **Email Activity:** Read Access
   - **Suppressions → Suppressions:** Read Access, or Full Access to use Remove Bounce
   - **Suppressions → Unsubscribe Groups:** Read Access
   - **Sender Authentication:** Read Access
3. When installing, enter the key and choose the API host: `api.sendgrid.com`, or `api.eu.sendgrid.com` for EU regional subusers.

## Tools

- **Find Messages by Recipient:** Find the 10 most recently active emails sent to an address, with status and open and click counts. Returns the message ID that Get Message needs.
- **Get Message:** Check one email's delivery events, up to 20, with the receiving server's reason for bounces, deferrals, and drops.
- **Check Bounce:** Check whether an address is on the bounce list, and why it bounced.
- **Check Block:** Check whether an address is on the block list, and why it was blocked.
- **Check Spam Report:** Check whether a recipient marked an email as spam.
- **Check Invalid Email:** Check whether an address is on the invalid emails list.
- **Check Group Unsubscribes:** Check which unsubscribe groups an address has unsubscribed from.
- **Check Global Unsubscribe:** Check whether an address is globally unsubscribed.
- **List Recent Bounces:** List the 10 most recent bounces from the last 7 days.
- **List Authenticated Domains:** List up to 20 authenticated sending domains and whether their DNS records are valid.
- **Remove Bounce:** Remove an address from the bounce list so SendGrid delivers to it again.

Start with Find Messages by Recipient, then use the message ID with Get Message. Use the check tools to find out why SendGrid stopped delivering to an address.

## Notes

- Find Messages by Recipient and Get Message use the Email Activity API, which needs SendGrid's paid Email Activity History add-on. Without it, these two tools return an error. SendGrid does not generate email activity data for EU regional subusers.
- The suppression tools read the lists of the account or subuser that owns the API key.
- To stop Captain from changing the bounce list, give the key read access only or disable Remove Bounce.
