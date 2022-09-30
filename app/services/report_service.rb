require 'external/client'

class ReportService
  def generate
    external_client = ::External::Client.new
    profiles = external_client.fetch_profiles
    repositories = external_client.fetch_repositories
  end
end
