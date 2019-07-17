class ListAndSaveStations
  def execute
    @number_of_stands = 10
    @repo = Velib::Repository.new

    v_stations = @repo.list_v_stations
    save_stations(v_stations)
  end

  private

  def save_stations(all_stations)
    all_stations.each do |d|
      station = Station.find_or_initialize_by(id_number: d.id_number) do |s|
        station.name = d.name
        station.latitude = d.position.lat
        station.longitude = d.position.lng
        station.available_stands = [d.available_bike_stands]
      end

      if station.persisted?
        station.available_stands = update_available_stands(station.available_stands, d.available_bike_stands)
      end
      station.save
    end
  end

  def update_available_stands(available_stands, current_available_stands)
    incremented_stands = available_stands.concat(current_available_stands)
    incremented_stands_size = incremented_stands.length
    if incremented_stands_size > @number_of_stands
      incremented_stands = incremented_stands.drop(incremented_stands_size - @number_of_stands)
    end
    incremented_stands
  end
end