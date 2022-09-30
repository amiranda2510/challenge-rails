module External
  class Client
    def fetch_profiles
      JSON.parse(File.read(Rails.root.join("lib/external/fixtures/profiles.json")))
    end

    def fetch_repositories
      JSON.parse(File.read(Rails.root.join("lib/external/fixtures/repositories.json")))
    end
  end
end
