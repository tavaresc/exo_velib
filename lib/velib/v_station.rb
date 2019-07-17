module Velib
  class VStation
    attr_accessor :number,
                  :contract_name,
                  :name,
                  :address,
                  :position,
                  :banking,
                  :bonus,
                  :bike_stands,
                  :available_bike_stands,
                  :available_bikes,
                  :status,
                  :last_update
  end
end