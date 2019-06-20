# frozen_string_literal: true

class StationsController < ApplicationController
  def index
    @stations = Station.all
  end
end
