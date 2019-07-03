module FindNearestStations
  def find_nearest_stations(lat, lng, number_of_stations)
    nearest_stations = []

    stations = Station.all
    stations.each do |s|
      s_distance = Geocoder::Calculations.distance_between([lat, lng], [s['latitude'], s['longitude']])

      if nearest_stations.blank?
        nearest_stations = [{ 'station' => s, 'distance' => s_distance }]
      elsif nearest_stations.size < number_of_stations
        nearest_stations << { 'station' => s, 'distance' => s_distance }
      else
        updated_stations = nearest_stations.map do |near_s|
          if (s_distance < near_s['distance'])
            s_distance
          end
          nearest_stations = updated_stations
        end
      end
    end
    nearest_stations
  end
end