class CreateAirlineBookingApps < ActiveRecord::Migration
  def change
    create_table :airline_booking_apps do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
