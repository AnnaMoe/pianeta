class BookingsController < ApplicationController

  def create
    @planet = Planet.find(params[:planet_id])
    @booking = Booking.new(booking_params)
    @booking.planet = @planet
    @booking.user = current_user
    @booking.save
  end

  private
  def booking_params
    params.require(:booking).permit(:check_in_date, :check_out_date, :price, :location, :number_of_guests)
  end
end
