class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :source
      t.string :destination
      t.string :pickup_date
      t.string :pickup_time
      t.integer :user_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
