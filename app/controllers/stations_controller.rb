class StationsController < ApplicationController
  include StationsInteractor

  def new
    @station = Station.new
  end

  def show
    @station = Station.new(params.permit(:latitude, :longitude))
    data = list_stations
    # set_sizes(5, 10)
    # data = Velib::RestClient.new.get_velib_api
    # Velib::Repository.new.map_to_station(data, @number_of_stands)

    # nearest_positions = find_nearest_stations(:latitude, :longitude, 5)

    # puts nearest_positions
  end
end
