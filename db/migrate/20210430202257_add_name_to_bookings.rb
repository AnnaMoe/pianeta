class AddNameToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :first_name, :string
  end
end
