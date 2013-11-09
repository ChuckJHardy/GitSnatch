require "git_snatch/configuration"
require "git_snatch/version"

class GitSnatch
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
    configuration
  end
end
