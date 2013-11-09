require 'simplecov'
require 'coveralls'

Coveralls.wear!

ENV["RAILS_ENV"] ||= 'test'

require 'webmock/rspec'
require 'rspec/autorun'
require 'vcr'
require 'git_snatch'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

WebMock.disable_net_connect!
RSpec.configure do |config|
  config.order = "random"
  config.filter_run :focus => true
  config.color_enabled = true
  config.run_all_when_everything_filtered = true
  config.treat_symbols_as_metadata_keys_with_true_values = true

  config.before do
    GitSnatch.configuration.endpoint = 'http://www.github.com'
    GitSnatch.configuration.auth_types = :basic
    GitSnatch.configuration.username = nil
    GitSnatch.configuration.password = nil
  end
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures'
  config.hook_into :webmock
  config.configure_rspec_metadata!
end
