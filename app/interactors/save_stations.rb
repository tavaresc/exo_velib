class SaveStations
  def execute(v_stations)
    @number_of_stands = 10

    @v_stations = v_stations
    save_stations
  end

  private
  def save_stations
    @v_stations.each do |v_station|
      updated_station = Station.find_or_initialize_by(id_number: v_station.number) do |station|
        station.name = v_station.name
        station.latitude = v_station.position.lat
        station.longitude = v_station.position.lng
        station.available_stands = [v_station.available_bike_stands]
      end

      # puts "-- updated_station = #{updated_station.name}"

      if updated_station.persisted?
        updated_station.available_stands = update_available_stands(updated_station.available_stands, v_station.available_bike_stands)
      end
      updated_station.save
    end
  end

  def update_available_stands(available_stands, current_available_stands)
    incremented_stands = available_stands << current_available_stands
    incremented_stands_size = incremented_stands.length
    if incremented_stands_size > @number_of_stands
      incremented_stands = incremented_stands.drop(incremented_stands_size - @number_of_stands)
    end
    incremented_stands
  end
end