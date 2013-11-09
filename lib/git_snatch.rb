require "git_snatch/configuration"
require "git_snatch/url"
require "git_snatch/curler"
require "git_snatch/request"
require "git_snatch/grab"
require "git_snatch/version"

class GitSnatch
  extend Configure

  def initialize(repo, sha)
    @repo = repo
    @sha = sha
  end

  def self.within(repo, sha)
    new(repo, sha)
  end

  def grab(location)
    Grab.new(@repo, @sha, location).content
  end
end

