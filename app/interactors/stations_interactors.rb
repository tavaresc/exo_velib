class StationsInteractor
  @number_of_stations = 0
  @number_of_stands = 0

  def initialize(n_stations, n_stands)
    @number_of_stations = n_stations
    @number_of_stands = n_stands
  end

  def find_nearest_stations(lat, lng, )
    nearest_stations = []

    stations = Station.all
    stations.each do |s|
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

  def save_stations(data)
    data.each do |d|
      Station.find_or_create_by(id_number: d[:number]) do |station|
        station.id_number = d[:number]

        station.latitude = d[:position][:lat]
        station.longitude = d[:position][:lng]
        station.available_stands = add_available_stands(station, d[:available_bike_stands], number_of_stands)
      end
    end
  end




  def map_to_station(response, number_of_stands)
    #   data = JSON.parse(response.read_body, symbolize_names: true)
    #   data.each do |d|
    #     Station.find_or_create_by(id_number: d[:number]) do |station|
    #       station.id_number = d[:number]

    #       station.latitude = d[:position][:lat]
    #       station.longitude = d[:position][:lng]
    #       station.available_stands = add_available_stands(station, d[:available_bike_stands], number_of_stands)
    #     end
    #   end
    # end

    # private
    # def add_available_stands(station, current_available_stands, number_of_stands)
    #   stations = station.available_stands
    #   stations << current_available_stands

    #   if stations.length > number_of_stands # stations.length == 10 (To test!)
    #     stations.drop(stations.length - @number_of_stands)
    #   end

    #   station.available_stands = stations
    # end
  end