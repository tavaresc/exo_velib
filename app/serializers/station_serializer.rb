class StationSerializer < ActiveModel::Serializer
  attributes :id_number, :name, :latitude, :longitude, :available_stands
end