module Velib
  class Position < ActiveModelSerializers::Model
    attr_accessor :lat,
                  :lng
  end
end