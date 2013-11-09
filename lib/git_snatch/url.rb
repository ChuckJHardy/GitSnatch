class GitSnatch
  class Url
    def initialize(repo, sha, location)
      @repo = repo
      @sha = sha
      @location = location
    end

    def full
      elements.join('/')
    end

    private
    attr_reader :repo, :sha, :location

    def elements
      [ base, username, repo, mode, sha, location ].compact
    end

    def mode
      'raw' unless github?
    end

    def github?
      base.include?('raw')
    end

    def username
      GitSnatch.configuration.username if github?
    end

    def base
      GitSnatch.configuration.endpoint
    end
  end
end
