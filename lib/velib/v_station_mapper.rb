module Velib
  class VStationMapper
    def initialize(position_mapper: PositionMapper.new)
      @position_mapper = position_mapper
    end

    def map(station_json)
      #byebug
      station = VStation.new

      #byebug
      #station.number = station_json[:number].to_i,
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
=begin

      a = station_json[:number].to_i
      c = station_json[:contract_name]
      d = position(station_json)
      e = station_json[:banking]
      f = station_json[:bonus]
      g = station_json[:bike_stands].to_i
      j = station_json[:available_bike_stands].to_i
      k = station_json[:available_bikes].to_i
      l = station_json[:status]
      n = station_json[:last_update].to_i
      VStation.new(number: a,contract_name: c,position: d,banking: e,bonus: f,bike_stands: g,available_bike_stands: j,available_bikes: k,status: l,last_update: n)

      byebug

      VStation.new(number: 1,contract_name: "c",position: { "lat"=>0.0, "lng"=>0.0 },banking: "e",bonus: "f",bike_stands: 1,available_bike_stands: 2,available_bikes: 3,status: "l",last_update: "n")
=end
    end

    def position(position_json)
      @position_mapper.map(position_json)
    end
  end
end