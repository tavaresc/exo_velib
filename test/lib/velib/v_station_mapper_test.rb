require 'test_helper'

module Velib
  class VStationMapperTest < ActiveSupport::TestCase
    setup do
      @mapper = VStationMapper.new
    end

    test 'should correctly map' do
      station_hash = JSON.parse(get_json_from_file('velib/station'), symbolize_names: true)
      station = @mapper.map(station_hash)

      assert_equal VStation, station.class
      assert_equal 9087, station.number
    end
  end
end