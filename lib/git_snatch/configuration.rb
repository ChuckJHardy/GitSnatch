module GitSnatch
  class Configuration
    attr_accessor :endpoint, :username, :password

    def initialize
      self.endpoint = 'http://www.github.com'
      self.username = nil
      self.password = nil
    end
  end
end
