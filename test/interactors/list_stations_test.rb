require 'test_helper'

class ListStationTest < ActiveSupport::TestCase
  setup do
    @interactor = ListStations.new
  end

  test 'should list a parsed station' do
    VCR.use_cassette("list_station_request") do

      stations = @interactor.execute
      first_station = stations.first
      assert_equal Array, stations.class
      assert_equal Velib::VStation, first_station.class
      assert_equal 9087, first_station.number
    end
  end
end