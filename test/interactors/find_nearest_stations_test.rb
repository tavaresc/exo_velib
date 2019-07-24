require 'test_helper'

class FindNearestStationsTest < ActiveSupport::TestCase
  setup do
    @number_of_stations = 5
    @interactor = FindNearestStations.new

    set_mocked_stations
  end

  test 'should find an array of 5 stations' do
    # lat = Random.new_seed
    # lng = Random.new_seed
    lat = 59.95128
    lng = 11.04959
    response = @interactor.execute(lat, lng)

    assert response.length == @number_of_stations
  end

  test 'should find stations numerically sorted' do
    lat = 59.95128
    lng = 11.04959
    is_sorted = true
    response = @interactor.execute(lat, lng)
    previous_distance = 0

    response.each do |s|
      current_distance = Geocoder::Calculations.distance_between([lat, lng], [s.latitude, s.longitude])
      is_sorted = is_sorted && (previous_distance <= current_distance)
      previous_distance = current_distance
    end

    assert is_sorted
  end

  test 'should find the nearest station in the exact coordinate' do
    lat = lng = 0
    response = @interactor.execute(lat, lng)

    assert response.first.id_number == 0
  end

  private
  def set_mocked_stations
    n = 0
    while n < 10
      create  :station,
      id_number: n,
      name: "#{n} - STATION-#{n}",
      latitude: n * Random.new_seed,
      longitude: n * Random.new_seed,
      available_stands: [n, (n + 1)]

      n += 1
    end
  end
end