class AddCreditcardExpirationDateToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :credit_card_expiration_date, :string
  end
end
