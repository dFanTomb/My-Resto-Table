class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :restaurant_id
      t.datetime :date

      t.timestamps
    end
  end
end
