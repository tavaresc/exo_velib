class ClientsInteractor
  def initialize
    @number_of_stands = 10
    @repo = Velib::Repository.new
    @serializer = StationSerializer.new
    #@station = Station.new
  end

  def fetch_and_save_stations
    p "--- perform fetch and save! -- "
    all_stations = fetch_stations
    save_stations(all_stations)
  end

  def fetch_stations
    p "--- perform fetch! -- "
    v_stations = @repo.list_v_stations
    @serializer.map_to_model(v_stations, @number_of_stations)
  end

  def save_stations(all_stations)
    p "--- perform save! -- "
    all_stations.each do |d|
      Station.find_or_create_by(id_number: d.id_number) do |station|
        station.available_stands = update_available_stands(station.available_stands, d.available_stands)
      end
    end
  end

  def update_available_stands(available_bike_stands, current_available_stands)
    incremented_stands = available_bike_stands.concat(current_available_stands)
    incremented_stands_size = incremented_stands.length

    incremented_stands.drop(incremented_stands_size - @number_of_stands) if incremented_stands_size > @number_of_stands
  end
end