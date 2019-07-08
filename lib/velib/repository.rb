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

    # def map_to_station(response, number_of_stands)
    #   data = JSON.parse(response.read_body, symbolize_names: true)
    #   data.each do |d|
    #     Station.find_or_create_by(id_number: d[:number]) do |station|
    #       station.id_number = d[:number]

    #       station.latitude = d[:position][:lat]
    #       station.longitude = d[:position][:lng]
    #       station.available_stands = add_available_stands(station, d[:available_bike_stands], number_of_stands)
    #     end
    #   end
    # end

    # private
    # def add_available_stands(station, current_available_stands, number_of_stands)
    #   stations = station.available_stands
    #   stations << current_available_stands

    #   if stations.length > number_of_stands # stations.length == 10 (To test!)
    #     stations.drop(stations.length - @number_of_stands)
    #   end

    #   station.available_stands = stations
    # end
  end
end