class PlanetsController < ApplicationController

  before_action :set_planet, only: [:show]

  def index
     @planets = Planet.all
  end

  def show
    @booking = Booking.new
  end

  private
  def set_planet
    @planet = Planet.find(params[:id])
  end

end
