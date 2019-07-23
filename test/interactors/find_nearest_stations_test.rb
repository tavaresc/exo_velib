require 'test_helper'

class FindNearestStationsTest < ActiveSupport::TestCase
  setup do
    @number_of_stations = 5
    @interactor = FindNearestStations.new

    set_mocked_stations
  end

  test 'should find an array of 5 stations' do
    lat = Random.new_seed
    lng = Random.new_seed
    a = @interactor.execute(lat, lng)

    assert a.length == @number_of_stations
  end

  test 'should find stations numerically sorted' do
    lat = 59.95128
    lng = 11.04959
    is_sorted = true
    response = @interactor.execute(lat, lng)
    previous_distance = 0

    response.each do |station|
      puts station.name
      #puts station.id_number
      puts station.latitude
      puts station.longitude



      is_sorted = is_sorted && (previous_distance <= station.distance)
      previous_distance = station.distance
    end

    puts is_sorted
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
        latitude: n,
        longitude: (n + 1.1234),
        available_stands: [n, (n + 1)]

      n += 1
    end
  end
end