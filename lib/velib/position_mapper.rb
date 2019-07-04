module Velib
  class PositionMapper
    def map(position_json)
      Position.new(
        lat: position_json.dig(:position, :lat).to_f,
        lng: position_json(:position, :lng).to_f
      )
    end
  end
end