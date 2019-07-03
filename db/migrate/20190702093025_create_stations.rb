# class Stations < ActiveRecord::Base
#   serialize :available_stands, Array
# end

class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.integer :id_number
      t.float :latitude
      t.float :longitude
      t.integer :available_stands, array: true, default: []
      # t.text :available_stands, default: [].to_yaml

      t.timestamps
    end
  end
end
