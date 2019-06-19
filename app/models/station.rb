class Station < ApplicationRecord
  validates :station_id, :name, :empty_slots, :free_bikes, :longitude, :latitude, presence: true
  validates :empty_slots, :free_bikes , numericality: { only_integer: true }
  validates :latitude, :longitude , numericality: true




end
