require 'test_helper'

module Velib
  class RestClientTest < ActiveSupport::TestCase
    setup do
      @client = RestClient.new
    end

    test 'should return data on get request' do
      VCR.use_cassette("velib_rest_client_request") do
        data = @client.get_stations
        formatted_data = JSON.pretty_generate(data.as_json)

        assert_match get_json_from_file('velib/rest_client_request'), formatted_data
      end
    end
  end
end