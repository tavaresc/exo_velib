class StationsController < ApplicationController
  def new
    @station = Station.new
  end

  def show
    @station = Station.new(params.permit(:latitude, :longitude))
    interactor = FindNearestStations.new
    #client = ListAndSaveStations.new
    #client.fetch_and_save_stations

    @stations = interactor.find_nearest_stations(@station.latitude, @station.longitude)

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @stations }
    end
  end
end
