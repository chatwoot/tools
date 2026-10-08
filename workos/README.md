Connect WorkOS to help Captain look up an AuthKit user's account, sessions, MFA factors, organizations, invitations, and SSO connections when a customer has trouble signing in.

## Setup

1. In the WorkOS Dashboard, switch to the environment you want Captain to read, open **API Keys**, and create a secret key. Use the production environment's key for real customers.
2. Enter the API key when installing.

WorkOS API keys are not scoped: the key grants full API access to that environment. Create a separate key for Captain so you can rotate it on its own. These tools only send read requests.

## Tools

- **Find User by Email:** Find up to 5 users by email address. Returns the user ID, whether the email is verified, creation and last sign-in times, external ID, and up to 10 metadata fields.
- **List User Organizations:** List up to 20 of a user's organization memberships, including inactive and pending ones, with role and whether directory sync manages the membership.
- **List User Sessions:** List up to 10 of a user's sessions, with sign-in method, status, IP address, and browser.
- **List User MFA Factors:** List up to 10 MFA factors a user has enrolled, such as an authenticator app.
- **List Invitations by Email:** List the 10 most recent invitations sent to an email address, with state and expiry.
- **Get Organization:** Check an organization's name, domains with their verification state, external ID, and up to 10 metadata fields.
- **List Organization SSO Connections:** List up to 10 SSO connections for an organization, with identity provider type, state, and domains.

Start with Find User by Email, then use the user ID or organization ID with the other tools.

## Notes

- The user, session, MFA, membership, and invitation tools read AuthKit (User Management) data. Users who exist only as standalone SSO profiles or directory users are not found.
- Invitation tokens and accept links are never shown to Captain.
