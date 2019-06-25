class PositionsController < ApplicationController
  include PositionsHelper

  def new
    @position = Position.new
  end

  def show
    @position = Position.new(params.permit(:latitude, :longitude))
    r = get_velib_api
    puts r
  end
end
