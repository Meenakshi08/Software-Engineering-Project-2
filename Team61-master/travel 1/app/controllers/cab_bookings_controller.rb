class CabBookingsController < ApplicationController

  def index
		@cab_bookings = CabBooking.all
	end
	
	def create
		user_id = params[:user_id]
		customer_id = params[:customer_id]
		@cab_booking = CabBooking.new(cab_params)
		@cab_booking.user_id= user_id
		@cab_booking.customer_id = customer_id
		httresponse = HTTParty.post("http://localhost:5000/cab_bookings/create.json",
					{			
						:body => @cab_booking.to_json,
						:headers => { 'Content-Type' => 'application/json',
						'Accept' => 'application/json' }
					}
		)
		response = httresponse.response
		status = response.code
		@cab_booking = CabBooking.new(httresponse.parsed_response)
		 $latest = @cab_booking.id
		if(status.eql? '201')
			redirect_to :controller=>'users', :action => 'show', :id=>@cab_booking.user_id, :notice => "Cab Booked for "+@cab_booking.customer_id.to_s
		elsif  (status.eql? '412')
			render :new
		end	
		
  end

  def update
    @cab_booking = CabBooking.new(cab_params)
    httresponse = HTTParty.post("http://localhost:5000/cab_bookings/update.json",
					{			
						:body => @cab_booking.to_json,
						:headers => { 'Content-Type' => 'application/json',
						'Accept' => 'application/json' }
					}
      )    
    response = httresponse.response
		status = response.code
		@cab_booking = CabBooking.new(httresponse.parsed_response)
      
		if(status.eql? '201')
			redirect_to :controller=>'users', :action => 'show', :id=>@cab_booking.user_id, :notice => "Cab Booking updated for "+@cab_booking.customer_id.to_s
      #render json: @cab_booking
    elsif  (status.eql? '412')
			render :new
		end	
  end
	
 	 def show
    		customer_id = params[:id]
    		user_id = params[:user_id]
    		
    		
    		@cab_booking = CabBooking.find(customer_id,user_id)
    		render json: @cab_booking
  	end
	
	private
	
	def last
		customer_id = params[:id]
    		user_id = params[:user_id]
    		c_id=CabBooking.find_cid(customer_id,user_id)
    		
    		@cab_booking = CabBooking.last(customer_id,c_id)
    		render json: @cab_booking
	end

	def cab_params
		params.require(:cab_booking).permit!
	end


end
