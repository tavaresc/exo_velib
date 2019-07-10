class StationsController < ApplicationController
  def new
    @station = Station.new
  end

  def show
    @station = Station.new(params.permit(:latitude, :longitude))
    interactor = StationsInteractor.new
    #client = ListAndSaveStations.new
    #client.fetch_and_save_stations

    @stations = interactor.find_nearest_stations(@station.latitude, @station.longitude)
  end
end
