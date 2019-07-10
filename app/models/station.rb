class Station < ApplicationRecord
  validates :latitude, presence: true
  validates :longitude, presence: true
end
