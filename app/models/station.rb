class Station < ApplicationRecord
  validates :station_id, :name, :space, :free_bikes, :latitude, :longitude, presence: true
  validates :empty_slots, :free_bikes , numericality: { only_integer: true }
  validates :latitude, :longitude , numericality: true

end
