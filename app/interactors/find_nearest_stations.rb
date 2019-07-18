class FindNearestStations
  def execute(lat, lng)
    number_of_stations = 5

    calculated_stations = []

    all_stations = Station.all
    # puts "all_stations = #{all_stations.first.name}"

    all_stations.each do |s|
      s_distance = Geocoder::Calculations.distance_between([lat, lng], [s.latitude, s.longitude])
      calculated_stations << { station: s, distance: s_distance }
    end
    # puts "calculated_stations = #{calculated_stations.length}"

    calculated_stations.sort_by { |s| s[:distance] }.take(number_of_stations).map { |s| s[:station] }
  end
end