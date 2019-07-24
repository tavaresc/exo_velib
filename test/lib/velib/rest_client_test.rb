require 'test_helper'

module Velib
  class RestClientTest < ActiveSupport::TestCase
    setup do
      @client = RestClient.new
    end

    test 'should return data on get request' do
      VCR.use_cassette("velib_rest_client_request") do
        data = @client.get_stations

        puts data.length
        puts data.class
        puts "data = #{data.as_json}" # {:error=>"Unauthorized"}

        assert_match get_json_from_file('velib/rest_client_request'), data.as_json
      end
    end
  end
end