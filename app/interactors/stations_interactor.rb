class StationsInteractor

  def initialize
    @number_of_stations = 5
    @repo = Velib::Repository.new
    @serializer = StationSerializer.new
  end

  def find_nearest_stations(lat, lng)
    calculated_stations = []

    all_stations = Station.all
    all_stations.each do |s|
      s_distance = Geocoder::Calculations.distance_between([lat, lng], [s['latitude'], s['longitude']])
      calculated_stations << { 'station' => s, 'distance' => s_distance }
    end
    nearest_stations = calculated_stations.sort_by { |s| s['distance'] }.take(5).map { |s| s['station'] }
  end
end