class StationSerializer < ActiveModel::Serializer
  def map_to_model(v_stations, number_of_stands)
    v_stations.map do |v_station|
      Station.new(
        id_number: v_station.number,
        name: v_station.name,
        latitude: v_station.position.lat,
        longitude: v_station.position.lng,
        available_stands: [v_station.available_bike_stands]
      ).as_json(except: [:created_at, :updated_at]) # TODO: use the gem
    end
  end
end
