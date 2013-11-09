class GitSnatch
  class Url
    def initialize(repo, sha, file)
      @repo = repo
      @sha = sha
      @file = file
    end

    def full
      elements.join('/')
    end

    private
    attr_reader :repo, :sha, :file

    def elements
      [ base, repo, mode, sha, file ]
    end

    def mode
      'raw'
    end

    def base
      GitSnatch.configuration.endpoint
    end
  end
end
