class GitSnatch
  class Grab
    def initialize(repo, sha, file)
      @repo = repo
      @sha = sha
      @file = file
    end

    def content
      request.body
    end

    def request
      Request.new(url)
    end

    private

    def url
      Url.new(@repo, @sha, @file).full
    end
  end
end
