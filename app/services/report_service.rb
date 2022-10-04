require 'external/client'

class ReportService
  def client_data
    profiles = external_client.fetch_profiles
    profiles.map do |profile|
      new_arr = []
      external_client.fetch_repositories.each do |repo|
        new_arr << repo if repo["profile_id"] == profile["id"]
      end
      profile["repositories"] = new_arr
    end
    profiles
  end

  private
    def external_client
      @external_client ||= ::External::Client.new
    end
end
