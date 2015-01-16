class AirlineBookingApps < ActiveRecord::Base
  has_and_belongs_to_many :airlines
  has_and_belongs_to_many :payment_options
  def self.find(uid)
    while(not Airline_booking_apps.user_id.nil?)
      if Airline_booking_apps.user_id==uid
        @airline_booking_apps_id = Airline_booking_apps.id
      end
    end
  end
end
