module Velib
  class VStationMapper
    def initialize(position_mapper: PositionMapper.new)
      @position_mapper = position_mapper
    end

    def map(station_json)
      station = VStation.new
      station.number = station_json[:number].to_i
      station.contract_name = station_json[:contract_name]
      station.name = station_json[:name]
      station.address = station_json[:address]
      station.position = position(station_json[:position])
      station.banking = station_json[:banking]
      station.bonus = station_json[:bonus]
      station.bike_stands = station_json[:bike_stands].to_i
      station.available_bike_stands = station_json[:available_bike_stands].to_i
      station.available_bikes = station_json[:available_bikes].to_i
      station.status = station_json[:status]
      station.last_update = station_json[:last_update].to_i

      station

    end

    def position(position_json)
      @position_mapper.map(position_json)
    end
  end
end