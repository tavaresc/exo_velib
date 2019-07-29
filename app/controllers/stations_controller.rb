class StationsController < ApplicationController
  def new
    @station = Station.new
  end

  def show
    @station = Station.new(params.permit(:latitude, :longitude))
    interactor = FindNearestStations.new

    p "--- Loading..."
    ListStations.new.execute

    @stations = interactor.execute(@station.latitude, @station.longitude)

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @stations, fields: [:id_number, :name, :available_stands] }
    end
  end
end
