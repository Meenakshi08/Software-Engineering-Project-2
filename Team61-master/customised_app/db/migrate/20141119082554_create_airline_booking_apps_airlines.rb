class CreateAirlineBookingAppsAirlines < ActiveRecord::Migration
  def change
    create_table :airline_booking_apps_airlines do |t|
      t.integer :airline_booking_app_id
      t.text :airline_id

      t.timestamps
    end
  end
end
