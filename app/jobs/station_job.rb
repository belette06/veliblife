# frozen_string_literal: true

require 'sidekiq-scheduler'
require 'pry'

class StationJob < ApplicationJob
  queue_as :default

  def perform
    response = HTTParty.get('http://api.citybik.es/v2/networks/velib', headers: { 'Content-Type' => 'application/json' })
    parse_response(response)
  end

  def parse_response(response)
    @velibs = response.parsed_response['network']
    @stations = @velibs['stations']
    register_stations(@stations)
  end

  def register_stations(park)
    park.each do |station|
      @redis_station = Station.find_or_initialize_by(station_id: station['id'].to_s)
      @redis_station.name = station['name'].to_s
      @redis_station.empty_slots = station['empty_slots'].to_i
      @redis_station.free_bikes = station['free_bikes'].to_i
      @redis_station.save
    end
  end
  end

# {
# "empty_slots"=>26,
#   "extra"=>{
#              "banking"=>false,
#              "bikes_overflow"=>0,
#              "dueDate"=>1560855600,
#              "ebikes"=>1,
#              "ebikes_overflow"=>0,
#              "has_ebikes"=>true,
#              "online"=>true,
#              "slots"=>28,
#              "status"=>"Operative",
#              "uid"=>"23103"
#             },
#   "free_bikes"=>2,
#   "id"=>"38c796827ac882128b0b04156c32ace3",
#   "latitude"=>48.828785140979505,
#   "longitude"=>2.2237222641706467,
#   "name"=>"Manufacture Nationale",
#   "timestamp"=>"2019-06-19T16:48:35.009000Z"}
