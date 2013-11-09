require 'curb'

class GitSnatch
  class Request
    def initialize(url)
      @url = url
    end

    def body
      get.body_str
    end

    private

    def get
      curl.tap { |c| c.perform }
    end

    def curl
      @curl ||= Curler.new(easy).build
    end

    def easy
      Curl::Easy.new(@url)
    end
  end
end
