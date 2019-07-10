require 'test_helper'

class StationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save station without latitude neither longitude" do
    station = Station.new
    assert_not station.save
  end

end
