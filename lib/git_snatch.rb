require "git_snatch/configuration"
require "git_snatch/version"

module GitSnatch
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
    configuration
  end
end
