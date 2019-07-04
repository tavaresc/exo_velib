module Velib
  class VStationMapper
    def map(station_json)
      VStation.new(
        number: station_json[:number].to_i,
        contract_name: station_json[:contract_name],
        position: position(station_json),
        banking: station_json[:banking],
        bonus: station_json[:bonus],
        bike_stands: station_json[:bike_stands].to_i,
        available_bike_stands: station_json[:available_bike_stands].to_i,
        available_bikes: station_json[:available_bikes].to_i,
        status: station_json[:status],
        last_update: station_json[:last_update].to_i
      )
    end

    def position(station_json)
      position_mapper(station_json[:position])
    end
  end
end