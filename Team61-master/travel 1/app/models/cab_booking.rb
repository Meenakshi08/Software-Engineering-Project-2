class CabBooking < ActiveRecord::Base

  def self.all
    @cab_bookings = []
    cabbookings_json = HTTParty.get('http://localhost:5000/users/1/customers/1/cab_bookings/create.json').parsed_response
    cabbookings_json.map {|b| @cab_bookings.push( CabBooking.new(:id => b['id'], :source => b['source'], :destination => b['destination'], :pickup_date => b['pickup_date'], :pickup_time => b['pickup_time'], :user_id => b['user_id'], :customer_id => b['customer_id']) )}
    return @cab_bookings 
  end

  def self.find (id, uid)
    @cab_booking = nil
    if not id.blank?
      cabbookings_json = HTTParty.get('http://localhost:5000/users/1/customers/1/cab_bookings/'+id.to_s+'.json').parsed_response
      if not cabbookings_json.nil?
        @cab_booking = CabBooking.new(:id =>  cabbookings_json['id'], :source =>  cabbookings_json['source'], :destination =>  cabbookings_json['destination'], :pickup_date =>  cabbookings_json['pickup_date'], :pickup_time =>  cabbookings_json['pickup_time'], :user_id =>  cabbookings_json['user_id'], :customer_id =>  cabbookings_json['customer_id'])

          return @cab_booking

      end
 
    end
    
  end
  def self.find_cid(id, uid)
    @cab_booking = nil
    if not id.blank?
      cabbookings_json = HTTParty.get('http://localhost:5000/users/1/customers/1/cab_bookings/'+id.to_s+'/last_cab_bookings/'+id.to_s+'.json').parsed_response
      if not cabbookings_json.nil?
        @cab_booking = CabBooking.new(:id =>  cabbookings_json['id'], :source =>  cabbookings_json['source'], :destination =>  cabbookings_json['destination'], :pickup_date =>  cabbookings_json['pickup_date'], :pickup_time =>  cabbookings_json['pickup_time'], :user_id =>  cabbookings_json['user_id'], :customer_id =>  cabbookings_json['customer_id'])

          return @cab_booking.customer_id

      end
 
    end
    
  end
  
  def self.last (id, cid)
    @cab_booking = nil
    if not id.blank?
     for i in (id.to_i-1).downto(1) do
      cabbookings_json = HTTParty.get('http://localhost:5000/users/1/customers/1/cab_bookings/'+i.to_s+'/last_cab_bookings/'+i.to_s+'.json').parsed_response
      if not cabbookings_json.nil?
        @cab_booking = CabBooking.new(:id =>  cabbookings_json['id'], :source =>  cabbookings_json['source'], :destination =>  cabbookings_json['destination'], :pickup_date =>  cabbookings_json['pickup_date'], :pickup_time =>  cabbookings_json['pickup_time'], :user_id =>  cabbookings_json['user_id'], :customer_id =>  cabbookings_json['customer_id'])
	 if(@cab_booking.customer_id==cid ) 
          return @cab_booking
	 end
      end
     end
    end
    
  end
  
  def self.next (id, cid)
    @cab_booking = nil
    if not id.blank?
      for i in (id.to_i+1).upto(100) do
        cabbookings_json = HTTParty.get('http://localhost:5000/users/1/customers/1/cab_bookings/'+i.to_s+'/next_cab_bookings/'+i.to_s+'.json').parsed_response
        if not cabbookings_json.nil?
          @cab_booking = CabBooking.new(:id =>  cabbookings_json['id'], :source =>  cabbookings_json['source'], :destination =>  cabbookings_json['destination'], :pickup_date =>  cabbookings_json['pickup_date'], :pickup_time =>  cabbookings_json['pickup_time'], :user_id =>  cabbookings_json['user_id'], :customer_id =>  cabbookings_json['customer_id'])
          if(@cab_booking.customer_id==cid )
   		   return @cab_booking
          end
        else break
		end
      end

    end
  end



end
