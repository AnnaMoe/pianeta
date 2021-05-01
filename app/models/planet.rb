class Planet < ApplicationRecord
  has_many :bookings
  belongs_to :user

  #validates :price, :title, :description, presence: true
  has_many_attached :photos
end
