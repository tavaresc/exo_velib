class StationsController < ApplicationController
  def new
    @station = Station.new
  end

  def show
    @station = Station.new(params.permit(:latitude, :longitude))
    interactor = StationsInteractor.new
    all_stations = interactor.list_stations
    #interactor.save_stations(all_stations)
    # set_sizes(5, 10)
    # data = Velib::RestClient.new.get_velib_api
    # Velib::Repository.new.map_to_station(data, @number_of_stands)
    byebug

    nearest_stations = interactor.find_nearest_stations(all_stations, :latitude, :longitude)
    puts nearest_stations
  end
end
