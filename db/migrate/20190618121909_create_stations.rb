class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.string :name
      t.integer :space
      t.integer :free_bikes
      t.latitude :float
      t.longitude :float

      t.timestamps
    end
  end
end
