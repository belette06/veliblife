# frozen_string_literal: true

class Station < ApplicationRecord
  validates :station_id, :name, :empty_slots, :free_bikes, :longitude, :latitude, presence: true

  def self.update_all_stations
    @stations = self::CityBikes.new.stations['network']['stations']

    @stations.each do |station|
      station['name']
      station_data = find_or_initialize_by(station_id: station['id']) do |parking|
        parking.name = station['name']
        parking.empty_slots = station['empty_slots'].to_f
        parking.latitude = station['latitude'].to_f
        parking.longitude = station['longitude'].to_f
        parking.free_bikes = station['free_bikes'].to_i
      end
      station_data.update!(free_bikes: station['free_bikes'].to_i)
    rescue StandardError
      retry
    end
  end

  class CityBikes
    include HTTParty
    base_uri 'http://api.citybik.es/v2/networks'

    def stations
      self.class.get('/velib')
    end
  end
end
