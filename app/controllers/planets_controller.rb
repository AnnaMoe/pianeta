class PlanetsController < ApplicationController

  before_action :set_planet, only: [:show]

  def index
    if params[:query].present?
      @planets = Planet.search_by_title_and_description(params[:query])
    else
      @planets = Planet.all
    end
    # planets = [ 
    #   'NES',
    #   'Jedha'
    # ]
    render(json: { 'planets' => @planets.map(&:title) })
  end

  def show
    @booking = Booking.new
  end

  def new
    @planet = Planet.new
  end

  def create
    @planet = Planet.new(planet_params)
    @planet.user = current_user
    @planet.save!
    redirect_to planet_path(@planet)
  end

  private
  def set_planet
    @planet = Planet.find(params[:id])
  end

  def planet_params
    params.require(:planet).permit(:price, :title, :description, :name_of_inhabitants,
      :name_of_space_station, :name_of_galaxy, :host_name, photos: [])
  end

end
