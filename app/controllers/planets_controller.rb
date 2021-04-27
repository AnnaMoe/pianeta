class PlanetsController < ApplicationController

  def index
  end

  def show
    @planet = Planet.all.first
  end
end
