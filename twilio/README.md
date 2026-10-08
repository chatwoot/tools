Connect Twilio to help Captain check whether a text message or call reached a phone number, why it failed, and whether the number is valid.

## Setup

1. Copy your **Account SID** from the Twilio Console dashboard.
2. Create an API key in the Twilio Console. A **Standard** key works. To narrow access, create a **Restricted** key that can read messages and calls and use Lookup.
3. Enter the Account SID, the API key SID (starts with `SK`), and the API key secret when installing.

## Tools

- **Find Messages to Number:** Find the 10 most recent SMS, MMS, or WhatsApp messages sent to a number, with delivery status and error codes. Message text is left out.
- **Find Messages from Number:** Find the 10 most recent messages a number sent to your Twilio numbers, such as a STOP reply, with the first 120 characters of each.
- **Get Message:** Recheck one message's delivery status, error code, and segment count.
- **Find Calls to Number:** Find up to 10 calls placed to a number, with status and duration.
- **Find Calls from Number:** Find up to 10 calls a number made to your Twilio numbers.
- **Look Up Phone Number:** Check whether a phone number is valid, with its country and standard formats.

Start with Find Messages to Number, then use the message SID with Get Message.

## Notes

- All tools are read-only and work on the one account or subaccount whose Account SID you enter.
- Phone numbers must be in E.164 format, such as `+15558675309`. For WhatsApp messages, prefix the number with `whatsapp:`.
- Outbound message text is never shown to Captain, so one-time codes cannot leak into a conversation.
- Look Up Phone Number uses Twilio's free Basic Lookup and requests no paid data packages.
- These tools call `api.twilio.com` and `lookups.twilio.com`. Twilio API keys are region-specific, so use a key created for the default US region.
