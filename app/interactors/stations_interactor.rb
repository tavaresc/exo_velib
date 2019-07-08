class StationsInteractor

  def initialize
    @number_of_stations = 5
    @repo = Velib::Repository.new
    @serializer = StationSerializer.new
  end

  def list_stations
    v_stations = @repo.list_v_stations
    @serializer.map_to_model(v_stations, @number_of_stations)
  end

  def find_nearest_stations(all_stations, lat, lng)
    nearest_stations = []

    stations = Station.all
    byebug
    all_stations.each do |s|
      s_distance = Geocoder::Calculations.distance_between([lat, lng], [s['latitude'], s['longitude']])

      if nearest_stations.blank?
        nearest_stations = [{ 'station' => s, 'distance' => s_distance }]
      elsif nearest_stations.size < @number_of_stations
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
=begin
  def save_stations(all_stations)
    all_stations.each do |d|
      Station.find_or_create_by(id_number: d[:number]) do |station|
        station.id_number = d[:number]

        station.latitude = d[:position][:lat]
        station.longitude = d[:position][:lng]
        station.available_stands = add_available_stands(station, d[:available_bike_stands], number_of_stands)
      end
    end
  end

  def add_available_stands(station, current_available_stands)
    stands_array = station.available_stands.split(' ') << current_available_stands.to_s

    if stands_array.length > @number_of_stands # stands_array.length == 10 (To test!)
      stands_array.drop(stands_array.length - @number_of_stands)
    end

    # stands_array.length > @number_of_stands || stands_array.drop(stands_array.length - @number_of_stands)
    stands_array.join(' ')
  end
=end
end