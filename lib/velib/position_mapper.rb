module Velib
  class PositionMapper
    def map(position_json)
      Position.new(
        lat: position_json[:lat].to_f,
        lng: position_json[:lng].to_f
      )
    end
  end
end