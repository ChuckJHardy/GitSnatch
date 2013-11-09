class GitSnatch
  module Configure
    extend self

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
      configuration
    end
  end

  class Configuration
    attr_accessor :endpoint, :auth_types, :username, :password

    def initialize
      self.endpoint   = 'http://www.github.com'
      self.auth_types = :basic
      self.username   = nil
      self.password   = nil
    end
  end
end
