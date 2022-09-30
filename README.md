# README

# Tasks
- Implement an endpoint to create profiles
  - Usernames may only contain alphanumeric characters and hyphens (-)
  - Usernames are unique
  - This endpoint shouldn't allow the superuser flag to be set
- Implement a reports endpoint
  - Review (and fix) the data model and migrations
    - One profile has many repositories
  - The endpoint supports HTML (it displays all users and their repositories in an HTML table) and JSON
  - The endpoint receives an optional tag parameter which allows to filter by users that have a repository with a given tag (the tags attribute is a comma separated list of words)
    - Tags don't need to be an exact match. They should match when the tag includes the received tag parameter
  - No pagination
- Implement the reports endpoint but with data fetched from external sources
  - No filtering required
  - No pagination
  - Fixtures provided in lib/fixtures
- Debug ViewCount

## Notes
- Tests should be written for each feature
- Ensure the code is reasonably secure
