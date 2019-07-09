class ClientsInteractor
  def initialize
    @number_of_stands = 10
    @repo = Velib::Repository.new
    @serializer = StationSerializer.new
  end

  def fetch_and_save_stations
    all_stations = fetch_stations
    save_stations(all_stations)
  end

  def fetch_stations
    v_stations = @repo.list_v_stations
    @serializer.map_to_model(v_stations, @number_of_stations)
  end

  def save_stations(all_stations)
    all_stations.each do |d|
      station = Station.find_or_initialize_by(id_number: d.id_number)
      stands = station.available_stands

      if stands
        station.available_stands = update_available_stands(stands, d.available_stands)
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