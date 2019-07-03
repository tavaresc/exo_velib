class StationsController < ApplicationController
  include StationsHelper
  def new
    @station = Station.new
  end

  def show
    @station = Station.new(params.permit(:latitude, :longitude))
    set_number_of_stations(5)
    get_velib_api

    check_position(:latitude, :longitude)

    puts @nearest_positions
  end
end
