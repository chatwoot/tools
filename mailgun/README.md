Connect Mailgun to help Captain check whether an email was delivered, why it failed, and whether an address is on a bounce, complaint, or unsubscribe list.

## Setup

1. In Mailgun, go to **Account Settings → API Keys** and create an API key. A domain sending key does not work. If your plan has role-based keys, choose a role that can read logs, suppressions, and domains, and can delete bounces if you want to use Remove Bounce.
2. When installing, enter the key, your sending domain such as `mg.example.com`, and the API host for the domain's region: `api.mailgun.net` for US or `api.eu.mailgun.net` for EU.

## Tools

- **Find Events by Recipient:** Find the 20 most recent log events for emails sent to an address, such as accepted, delivered, or failed, with failure reasons. Returns the message ID that Get Message Events needs.
- **Get Message Events:** Follow one message through up to 20 log events, oldest first.
- **List Recent Failures:** List the 10 most recent failed deliveries for the sending domain.
- **Check Bounce:** Check whether an address is on the bounce list, with the SMTP error that caused it.
- **Check Complaint:** Check whether an address is on the spam complaint list.
- **Check Unsubscribe:** Check whether an address is on the unsubscribe list, and for which tags.
- **Get Domain Status:** Check whether the sending domain is active and its sending DNS records are valid.
- **Remove Bounce:** Remove an address from the bounce list so Mailgun delivers to it again.

Start with Find Events by Recipient, then use the message ID with Get Message Events.

## Notes

- All tools work on the one sending domain entered at install. To cover another domain, install the integration again.
- The three log tools use Mailgun's Logs API. How far back they can search depends on your plan's log retention, so searches beyond it can return an error or nothing.
- The three check tools match addresses that start with the address given and show up to 5 matches.
- To stop Captain from changing the bounce list, disable Remove Bounce.
