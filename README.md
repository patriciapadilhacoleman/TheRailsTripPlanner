# TheRailsTripPlanner
This app helps you organize your next trip

DB: The Database has the following table:

User: each traveler can have may trips

Trips: each trip can have many users, but they will have to share all the common days and activities.
One traveler will hold the administrator priviledges and will have special views and access.

TripsUsers: has a boolean to indicate if the user is an administrator

Users: Belongs to many
Tickets: Has many
Days: Has many

Tickets:
 Trip: belongs to
 User: has may through trips

Days:
  Trip: belong to
  Lodging: belong to
  Activities: have many

Trip:
  Days: have Many
  Tickets: have Many
  Budget: have One
  Activities: many through Days
  Lodging: Many through Days

Activities:
 Days: belongs to

Lodging:
 Days: has many
 Trip: has many through

Sign IN: the sign in is available using Omniauth and Facebook as
well as by using Bcrypt for a separate Authentication.

Nested Routes:
View Days and Activities by Trip
