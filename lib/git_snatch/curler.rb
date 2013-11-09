class GitSnatch
  class Curler
    def initialize(curl)
      @curl = curl
    end

    def build
      @curl.tap do |c|
        c.http_auth_types = auth_types if auth?
        c.username = username if username
        c.password = password if password
      end
    end

    private

    def username
      GitSnatch.configuration.username
    end

    def password
      GitSnatch.configuration.password
    end

    def auth?
      username && password
    end

    def auth_types
      GitSnatch.configuration.auth_types
    end
  end
end
