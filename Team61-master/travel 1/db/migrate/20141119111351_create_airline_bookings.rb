class CreateAirlineBookings < ActiveRecord::Migration
  def change
    create_table :airline_bookings do |t|
      t.integer :user_id
      t.integer :customer_id
      t.string :source
      t.string :destination
      t.string :flight_no
      t.string :departure_time
      t.string :total_fare
      t.integer :airline_id

      t.timestamps
    end
  end
end
