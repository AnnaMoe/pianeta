class AddLastnameToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :last_name, :string
  end
end
