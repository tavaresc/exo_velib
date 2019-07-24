ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'vcr'

class ActiveSupport::TestCase
  # Setup all fixtures using factory_bot in test/factories/*.yml for all tests.
  include FactoryBot::Syntax::Methods

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
end

def get_json_from_file(path)
  JSON.parse(File.read("fixtures/json/#{path}.json"))
end

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end
