class CreateAirlineBookingAppsPaymentOptions < ActiveRecord::Migration
  def change
    create_table :airline_booking_apps_payment_options do |t|
      t.integer :airline_booking_app_id
      t.integer :payment_option_id

      t.timestamps
    end
  end
end
