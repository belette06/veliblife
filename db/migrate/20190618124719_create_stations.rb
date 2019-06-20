# frozen_string_literal: true

class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.string :station_id
      t.string :name
      t.integer :empty_slots
      t.integer :free_bikes
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
