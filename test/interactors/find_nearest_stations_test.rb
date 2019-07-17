require 'test_helper'

class FindNearestStationsTest < ActiveSupport::TestCase
  setup do
    @interactor = FindNearestStations.new
  end

  test 'should find a non empty array of stations' do
    lat = Random.new_seed
    lng = Random.new_seed

    assert_not @interactor.execute(lat, lng).empty?
  end
end