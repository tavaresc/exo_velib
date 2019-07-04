module Velib
  class VStation < ActiveModelSerializers::Model
    attr_accessor :number
                  :contract_name
                  :position
                  :banking
                  :bonus
                  :bike_stands
                  :available_bike_stands
                  :available_bikes
                  :status
                  :last_update
  end
end




