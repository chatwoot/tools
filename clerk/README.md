Connect Clerk to help Captain look up a user's account, sign-in status, active sessions, and organizations when a customer has trouble signing in.

## Setup

1. In the Clerk Dashboard, open the **API keys** page for the instance you want Captain to read, and copy a **Secret key**. Use the production instance's key (`sk_live_`) for real customers.
2. Enter the secret key when installing.

Clerk secret keys are not scoped: the key grants full Backend API access to that instance. Create a separate secret key for Captain so you can rotate it on its own. These tools only send read requests.

## Tools

- **Find User by Email:** Find up to 5 users by exact email address. Returns the user ID, email verification status, creation and last sign-in dates, whether the user is banned or locked, and whether two-factor authentication is on.
- **Get User:** Check one user's full details: every email address and phone number with its verification status, password and two-factor settings, passkeys, social and enterprise SSO accounts, ban and lock status, and up to 10 public metadata fields.
- **List User Organizations:** List up to 20 organizations a user belongs to, with their role and join date.
- **List User Sessions:** List a user's 10 most recent active sessions, with browser, device, and approximate location.
- **Get Organization:** Check an organization's name, slug, member count, pending invitation count, membership limit, and public metadata.
- **List Organization Invitations:** List the 20 most recent pending invitations to an organization.
- **List Organization SSO Connections:** List up to 10 enterprise SSO connections for an organization, with provider, active status, and domains.

Start with Find User by Email, then use the user ID or organization ID with the other tools.

## Notes

- All requests set `Clerk-API-Version: 2026-05-12`.
- Private and unsafe metadata, session IP addresses, and invitation links are never shown to Captain.
- The organization tools need Organizations enabled in Clerk, and List Organization SSO Connections needs enterprise SSO.
- Clerk removes old and inactive sessions over time, so List User Sessions only covers current activity.
