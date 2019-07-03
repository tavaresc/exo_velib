class StationsController < ApplicationController
  include StationsHelper
  include RestClient
  include Repository
  include FindNearestStations

  def new
    @station = Station.new
  end

  def show
    @station = Station.new(params.permit(:latitude, :longitude))
    set_sizes(5, 10)
    data = get_velib_api
    map_to_station(data, @number_of_stands)

    nearest_positions = find_nearest_stations(:latitude, :longitude, 5)

    puts nearest_positions
  end
end
