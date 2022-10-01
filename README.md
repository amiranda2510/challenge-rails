# README

# Tasks
- Implement an endpoint to create profiles
  - Usernames may only contain alphanumeric characters and hyphens (-)
  - Usernames are unique
  - This endpoint shouldn't allow the `superuser` flag to be set
- Implement a reports endpoint
  - Review (and fix) the data model and migrations
    - The relation between profiles and repositories is 1:n
  - Path to the endpoint is `/reports/`
  - The endpoint supports HTML (it displays all users and their repositories in an HTML table) and JSON
  - The endpoint receives an optional `tag` parameter which filters the response by users that have a repository with a given tag (the `tags` attribute is a comma separated list of words)
    - Tags don't need to be an exact match. They should match when the tag includes the received `tag` parameter
  - No pagination required
- Implement the reports endpoint but with data fetched from external sources
  - No filtering required
  - No pagination required
  - Path to the endpoint is `/reports/external`
  - Fixtures provided in `lib/external/fixtures`
  - Fixtures also provided in `spec/fixtures`
  - This is done in `ReportService#generate` (`app/services/report_service.rb`)
  - In the tests, `::External::Client` should be treated as if it was contacting an external service through HTTP. That is, the original implementation of the `#fetch_profiles` and `#fetch_repositories` shouldn't be executed
- Debug the ViewCount feature
  - Whenever a request for `HomeController#index` is processed, a `ViewCount` record that has a '/' `path`, should have its `#view` counter incremented by one
  - The test for the feature works (`spec/requests/home_spec.rb`)
  - Sometimes the counter isn't increased even though the logs show the request was processed successfully
  - It cannot be reproduced in the developers' local environment
  - It only happens in production when there's a high volume of users visiting the page
  - It's not related to caching

## Notes
- Tests should be written for each feature
- Ensure the code is reasonably secure
