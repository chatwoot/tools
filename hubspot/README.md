Connect HubSpot to help Captain look up contacts and their companies, tickets, and deals in your CRM.

## Setup

A super admin can create an access token in HubSpot under **Development → Legacy apps → Create legacy app → Private**. Give the app these scopes, then enter its access token when installing:

- `crm.objects.contacts.read`
- `crm.objects.companies.read`
- `crm.objects.deals.read`
- `tickets`

## Tools

- **Find Contact by Email:** Find a contact by their primary email address. Returns the contact ID the other tools need.
- **List Contact Companies:** Check up to 5 companies associated with a contact, with name, domain, website, and phone.
- **List Contact Tickets:** Check a contact's 10 most recent tickets, with subject, description, priority, category, and pipeline stage ID.
- **List Contact Deals:** Check a contact's 10 most recent deals, with amount, close date, and deal stage ID.
- **List Pipeline Stages:** List ticket or deal pipelines and the name of every stage, up to 20 pipelines.

Start with Find Contact by Email, then use the contact ID with the list tools.

## Notes

- These tools call HubSpot's date-versioned `2026-09` CRM API.
- HubSpot returns ticket and deal stages as IDs. Captain calls List Pipeline Stages to turn them into names.
- Find Contact by Email matches a contact's primary email, not their additional emails.
- New or updated records can take a few moments to appear, because the lookups use HubSpot's CRM search API. Search is limited to five requests per second per account.
- Deal amounts are shown without a currency, in the deal's own currency.
