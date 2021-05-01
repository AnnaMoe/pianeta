class BookingsController < ApplicationController

  def create
    @planet = Planet.find(params[:planet_id])
    @booking = Booking.new(booking_params)
    @booking.planet = @planet
    @booking.user = current_user
    @booking.save!
    redirect_to edit_planet_booking_path(@planet, @booking)
    # else 
    #   render ''
    # end
  end

  def new
    @booking =Booking.new
    
  end

  def edit
    @booking =Booking.find(params[:id])
  end

  def update
    @booking =Booking.find(params[:id])
    @booking.update(booking_params)
      redirect_to planet_booking_path(@booking.planet, @booking)
  end

  def show

  end

  private
  def booking_params
    params.require(:booking).permit(:check_in_date, :check_out_date, :price, :location, :number_of_guests)
  end
end
