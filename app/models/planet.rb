class Planet < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :price, :title, presence: true
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
