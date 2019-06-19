require 'sidekiq-scheduler'

class StationinfoJob < ApplicationJob
  queue_as :default

  def perform
    response = HTTParty.get('http://api.citybik.es/v2/networks/velib', headers: { 'Content-Type' => 'application/json' })
    parse_response(response)
  end

  def parse_response(response)
   @velibs = response.parsed_response["network"]
   @stations = @velibs["stations"]
   register_stations(@stations)
  end

  def register_stations(stations)
    stations.each do |station|
      next unless Station.exists?(station_id: station["id"].to_s)

      @station = Station.find_by(station_id: station["id"].to_s)
      @station.name = station["name"].to_s
      @station.space = station["empty_slots"].to_i
      @station.free_bikes = station["free_bikes"].to_i
      @station.save
    end
   end


end

