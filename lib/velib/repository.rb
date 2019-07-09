module Velib
  class Repository
    def initialize
      @client = RestClient.new
      @v_station_mapper = VStationMapper.new
    end

    def list_v_stations
      raw_stations = @client.get_stations
      raw_stations.map { |station| @v_station_mapper.map(station) }# || []
    end
  end
end