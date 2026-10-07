Connect Acuity Scheduling to help Captain find a customer's appointments, list what can be booked, and check open dates and times.

## Setup

1. In Acuity, open Integrations and find the API section to view your API credentials: a numeric User ID and an API Key.
2. Enter the User ID and API key when installing. Acuity uses them as the username and password for HTTP Basic authentication.

The API key gives full access to the Acuity account, so store it only here. These tools only read data.

## Tools

- **Find Appointments by Email:** Find a customer's 10 most recent appointments by email address, including canceled ones. Each result includes the appointment ID, time, calendar, price, and whether it is paid.
- **Get Appointment:** Get one appointment's details, including payment, location, up to 10 answers from each intake form, whether the client can reschedule or cancel online, and the client's appointment page link.
- **List Appointment Types:** List up to 30 services and classes with duration, price, category, and the appointment type ID the availability tools need.
- **Get Available Dates:** List the dates in a month that have open times for an appointment type, in the customer's time zone.
- **Get Available Times:** List up to 60 open times on one date for an appointment type, in the customer's time zone.
- **List Calendars:** List up to 30 calendars with their location and time zone.

Start with Find Appointments by Email for questions about an existing booking. For new bookings, use List Appointment Types, then Get Available Dates and Get Available Times.

## Notes

- Availability matches what clients see on your Acuity scheduling page, across all calendars the appointment type is offered on.
- Appointment times are shown as Acuity returns them, with the UTC offset included.
- Captain cannot book, reschedule, or cancel appointments. It shares the client's appointment page link instead.
