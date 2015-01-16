class AirlineBooking < ActiveRecord::Base
def self.all
    @airline_bookings = []
    airlinebookings_json = HTTParty.get('http://localhost:5001/users/1/customers/1/airline_bookings/create.json').parsed_response
    airlinebookings_json.map {|b| @airline_bookings.push( AirlineBooking.new(:id => b['id'], :source => b['source'], :destination => b['destination'], :flight_no => b['flight_no'], :departure_time => b['departure_time'], :user_id => b['user_id'], :customer_id => b['customer_id'],:total_fare => b['total_fare'], :airline_id => b['airline_id']) )}
    return @airline_bookings 
  end

  def self.find (id, uid)
    @airline_booking = nil
    if not id.blank?
      airlinebookings_json = HTTParty.get('http://localhost:5001/users/1/customers/1/airline_bookings/'+id.to_s+'.json').parsed_response
      if not airlinebookings_json.nil?
        @airline_booking = AirlineBooking.new(:id =>  airlinebookings_json['id'], :source =>  airlinebookings_json['source'], :destination =>  airlinebookings_json['destination'], :flight_no =>  airlinebookings_json['flight_no'], :departure_time =>  airlinebookings_json['departure_time'], :user_id =>  airlinebookings_json['user_id'], :customer_id =>  airlinebookings_json['customer_id'], :total_fare=>  airlinebookings_json['total_fare'], :airline_id =>  airlinebookings_json['airline_id'])

          return @airline_booking

      end
 
    end
    
  end
  def self.find_cid(id, uid)
    @airline_booking = nil
    if not id.blank?
      airlinebookings_json = HTTParty.get('http://localhost:5001/users/1/customers/1/airline_bookings/'+id.to_s+'/last_airline_bookings/'+id.to_s+'.json').parsed_response
      if not airlinebookings_json.nil?
       @airline_booking = AirlineBooking.new(:id =>  airlinebookings_json['id'], :source =>  airlinebookings_json['source'], :destination =>  airlinebookings_json['destination'], :flight_no =>  airlinebookings_json['flight_no'], :departure_time =>  airlinebookings_json['departure_time'], :user_id =>  airlinebookings_json['user_id'], :customer_id =>  airlinebookings_json['customer_id'], :total_fare=>  airlinebookings_json['total_fare'], :airline_id =>  airlinebookings_json['airline_id'])

          return @airline_booking.customer_id

      end
 
    end
    
  end
  
  def self.last (id, cid)
    @airline_booking = nil
    if not id.blank?
     for i in (id.to_i-1).downto(1) do
      airlinebookings_json = HTTParty.get('http://localhost:5001/users/1/customers/1/airline_bookings/'+i.to_s+'/last_airline_bookings/'+i.to_s+'.json').parsed_response
      if not airlinebookings_json.nil?
        @airline_booking = AirlineBooking.new(:id =>  airlinebookings_json['id'], :source =>  airlinebookings_json['source'], :destination =>  airlinebookings_json['destination'], :flight_no =>  airlinebookings_json['flight_no'], :departure_time =>  airlinebookings_json['departure_time'], :user_id =>  airlinebookings_json['user_id'], :customer_id =>  airlinebookings_json['customer_id'], :total_fare=>  airlinebookings_json['total_fare'], :airline_id =>  airlinebookings_json['airline_id'])
	 if(@airline_booking.customer_id==cid ) 
          return @airline_booking
	 end
      end
     end
    end
    
  end
  
  def self.next (id, cid)
    @airline_booking = nil
    if not id.blank?
      for i in (id.to_i+1).upto(100) do
        airlinebookings_json = HTTParty.get('http://localhost:5001/users/1/customers/1/airline_bookings/'+i.to_s+'/next_airline_bookings/'+i.to_s+'.json').parsed_response
        if not airlinebookings_json.nil?
          @airline_booking = AirlineBooking.new(:id =>  airlinebookings_json['id'], :source =>  airlinebookings_json['source'], :destination =>  airlinebookings_json['destination'], :flight_no =>  airlinebookings_json['flight_no'], :departure_time =>  airlinebookings_json['departure_time'], :user_id =>  airlinebookings_json['user_id'], :customer_id =>  airlinebookings_json['customer_id'], :total_fare=>  airlinebookings_json['total_fare'], :airline_id =>  airlinebookings_json['airline_id'])
          if(@airline_booking.customer_id==cid )
   		   return @airline_booking
          end
        else break
		end
      end

    end
  end


end
