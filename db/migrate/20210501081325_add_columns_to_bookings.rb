class AddColumnsToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :email, :string
    add_column :bookings, :phone_number, :string
    add_column :bookings, :credit_card, :integer
  end
end
