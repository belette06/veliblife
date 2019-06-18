class StationsController < ApplicationController
  def index
    response = HTTParty.get('http://api.citybik.es/v2/networks/velib', :headers =>{'Content-Type' => 'application/json'})
    # JSON.parse response, symbolize_names: true
    @velibs = response.parsed_response

  end
end
