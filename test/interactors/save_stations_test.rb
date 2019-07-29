require 'test_helper'

class SaveStationsTest < ActiveSupport::TestCase
  setup do
    @interactor = SaveStations.new

    VCR.use_cassette('velib_rest_client_request') do
      @all_stations = ListStations.new.execute
    end
  end

  test 'should save mock in DB' do
    @interactor.execute(@all_stations)
    station = Station.find_by(id_number: 9087)
    assert_equal "9087-MAZARGUES", station.name
  end

  test 'should update available stations' do
    @interactor.execute(@all_stations)
    station = Station.find_by(id_number: 9087)

    assert_equal Array, station.available_stands.class
    assert_equal [21], station.available_stands
  end
end