module Repository
  def map_to_station(response, number_of_stands)
    data = JSON.parse(response.read_body, symbolize_names)
    data.each do |d|
      Station.find_or_create_by(id_number: d[:number]) do |station|
        station.id_number = d[:number]

        station.latitude = d[:position][:lat]
        station.longitude = d[:position][:lng]
        station.available_stands = add_available_stands(station, d[:available_bike_stands], number_of_stands)
      end
    end
  end

  private
  def add_available_stands(station, current_available_stands, number_of_stands)
    stations = station.available_stands
    stations << current_available_stands

    if stations.length > number_of_stands # stations.length == 10 (To test!)
      stations.drop(stations.length - @number_of_stands)
    end

    station.available_stands = stations
  end
end