Connect Postmark to help Captain check whether an email was sent and delivered, why it bounced, and whether an address is suppressed.

## Setup

1. In Postmark, open the server that sends your email and go to **API Tokens**. Copy a Server API token. A server token gives access to that one server only.
2. Find the ID of the message stream to check under the server's **Message Streams**. The default transactional stream is `outbound`.
3. Enter the token and the message stream ID when installing.

## Tools

- **Find Messages by Recipient:** Find up to 10 emails sent to an address, with subject, status, and sent time. Returns the message ID that Get Message Details needs.
- **Get Message Details:** Check one email's delivery events, up to 20, such as delivered, delayed, bounced, opened, or link clicked.
- **Find Bounces by Email:** Find up to 10 bounces and spam complaints for an address, with the reason and whether Postmark deactivated the address.
- **List Recent Bounces:** List up to 10 bounces in the message stream.
- **Check Suppression:** Check whether an address is suppressed, and whether a hard bounce, spam complaint, or manual suppression caused it.
- **Get Delivery Stats:** Check the server's bounce totals by type and its number of deactivated addresses.
- **Remove Suppression:** Remove an address from the suppression list so Postmark sends to it again.

Start with Find Messages by Recipient, then use the message ID with Get Message Details.

## Notes

- All tools except Get Delivery Stats work on one message stream of one server. To cover another stream, such as `broadcast`, install the integration again with that stream ID.
- Postmark keeps messages and bounces for the server's retention period, 45 days by default.
- Postmark does not allow removing spam complaint suppressions.
- Get Message Details fails for emails whose full content is larger than 1 MB, because Postmark returns the email body along with its events.
- To stop Captain from changing the suppression list, disable Remove Suppression.
