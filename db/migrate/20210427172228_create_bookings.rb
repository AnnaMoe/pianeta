class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :check_in_date
      t.date :check_out_date
      t.string :location
      t.integer :price
      t.integer :number_of_guests
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
