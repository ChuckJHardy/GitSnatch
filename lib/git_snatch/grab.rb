class GitSnatch
  class Grab
    def initialize(repo, sha, location)
      @repo = repo
      @sha = sha
      @location = location
    end

    def content
      request.body
    end

    def request
      Request.new(url)
    end

    private

    def url
      Url.new(@repo, @sha, @location).full
    end
  end
end
