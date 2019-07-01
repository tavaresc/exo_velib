class PositionsController < ApplicationController
  include PositionsHelper

  def new
    @position = Position.new
  end

  def show
    @position = Position.new(params.permit(:lat, :lng))
    set_number_of_positions(5)
    response = get_velib_api

    response.each do |p|
      check_position(p, :lat, :lng)
    end

    puts @nearest_positions
  end
end
