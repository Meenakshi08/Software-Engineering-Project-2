class AirlineBookingsController < ApplicationController

def index
		@airline_bookings = AirlineBooking.all
	end
	
	def create
		user_id = params[:user_id]
		customer_id = params[:customer_id]
		@airline_booking = AirlineBooking.new(airline_params)
		@airline_booking.user_id= user_id
		@airline_booking.customer_id = customer_id
		httresponse = HTTParty.post("http://localhost:5001/airline_bookings/create.json",
					{			
						:body => @airline_booking.to_json,
						:headers => { 'Content-Type' => 'application/json',
						'Accept' => 'application/json' }
					}
		)
		response = httresponse.response
		status = response.code
		@airline_booking = AirlineBooking.new(httresponse.parsed_response)
		 $latest = @airline_booking.id
		if(status.eql? '201')
			redirect_to :controller=>'users', :action => 'show', :id=>@airline_booking.user_id, :notice => "Airline Booked for "+@airline_booking.customer_id.to_s
		elsif  (status.eql? '412')
			render :new
		end	
		
  end

  def update
    @airline_booking = AirlineBooking.new(airline_params)
    httresponse = HTTParty.post("http://localhost:5001/airline_bookings/update.json",
					{			
						:body => @airline_booking.to_json,
						:headers => { 'Content-Type' => 'application/json',
						'Accept' => 'application/json' }
					}
      )    
    response = httresponse.response
		status = response.code
		@airline_booking = AirlineBooking.new(httresponse.parsed_response)
      
		if(status.eql? '201')
			redirect_to :controller=>'users', :action => 'show', :id=>@airline_booking.user_id, :notice => "Airline Booking updated for "+@airline_booking.customer_id.to_s
      #render json: @airline_booking
    elsif  (status.eql? '412')
			render :new
		end	
  end
	
 	 def show
    		customer_id = params[:id]
    		user_id = params[:user_id]
    		
    		
    		@airline_booking = AirlineBooking.find(customer_id,user_id)
    		render json: @airline_booking
  	end
	
	private
	
	def last
		customer_id = params[:id]
    		user_id = params[:user_id]
    		c_id=AirlineBooking.find_cid(customer_id,user_id)
    		
    		@airline_booking = AirlineBooking.last(customer_id,c_id)
    		render json: @airline_booking
	end

	def airline_params
		params.require(:airline_booking).permit!
	end


end
