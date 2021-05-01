class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :planet

  #validates :check_in_date, :check_out_date, :price, :location, :number_of_guests, presence: true
  validates :check_in_date, :check_out_date, :number_of_guests, presence: true
end
