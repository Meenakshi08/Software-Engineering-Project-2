class UsersController < ApplicationController
	
$airlines=""
$ary = Array.new  
	
	def flight
		$ary.clear
		@user = User.find(params[:id])
		@airline = Airline.find(params[:id])

		$airlines=@airline.airline_name
		if ($airlines.include? "1")
		$ary.push(1)
		end
		if ($airlines.include? "2")
		$ary.push(2)
		end
		if ($airlines.include? "3")
		$ary.push(3)
	    	end
		if ($airlines.include? "4")
		$ary.push(4)
		end
		$airlines=""
	
	end
	def aboutus
		render :action => 'aboutus'
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		t = @user.to_json
		httresponse = HTTParty.post("http://localhost:4000/users.json",
					{			
						:body => @user.to_json,
						:headers => { 'Content-Type' => 'application/json',
						'Accept' => 'application/json' }
					}
		)
		response = httresponse.response
		status = response.code
		@user = User.new(httresponse.parsed_response)
		if(status.eql? '201')
			redirect_to root_url, :notice => "Signed up!"
		elsif  (status.eql? '412')
			render :new
		end	
		
	end

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		customer_id = params[:customer_id]
	        if(customer_id.nil?)
	          @customer = Customer.new
	        else
	          @customer = Customer.find(customer_id)
	        end
		cab_booking_id = params[:cab_booking_id]
    		if(cab_booking_id.nil?)
      			@cab_booking = CabBooking.new
    		else
      			@cab_booking = CabBooking.find(booking_id)
        	end
		@last_cab_booking = CabBooking.new
        	airline_booking_id = params[:airline_booking_id]
    		if(airline_booking_id.nil?)
      			@airline_booking = AirlineBooking.new
    		else
      			@airline_booking = AirlineBooking.find(booking_id)
        	end
        	@db_items = RegisteredApps.all
    c = RegisteredApps.count  
    @query_values = Array.new(c) 
    @id=@user.id
    @db_items.each do |item|
      if(item.Name.eql? "Cab Booking")
        httresponse = HTTParty.post("http://localhost:5000/queryuser_cab.json",
          {
            :body => @id.to_json,
            :headers => { 'Content-Type' => 'application/json',
            'Accept' => 'application/json' }
          }
        )
        response = httresponse.response
        status = response.code
        if(status.eql? '200')
          @query_values[0] = '1'
        elsif(status.eql? '404')
          @query_values[0] = '0'
        end
      end

      if(item.Name.eql? "Flight Booking")
        httresponse = HTTParty.post("http://localhost:5001/queryuser_airline.json",
          {
            :body => @id.to_json,
            :headers => { 'Content-Type' => 'application/json',
            'Accept' => 'application/json' }
          }
        )
        response = httresponse.response
        status = response.code
        if(status.eql? '200')
          @query_values[1] = '1'
          
  		$ary.clear
		@airline = Airline.find(params[:id])

		$airlines=@airline.airline_name
		if ($airlines.include? "1")
		$ary.push(1)
		end
		if ($airlines.include? "2")
		$ary.push(2)
		end
		if ($airlines.include? "3")
		$ary.push(3)
	    	end
		if ($airlines.include? "4")
		$ary.push(4)
		end
		$airlines=""
          
        elsif(status.eql? '404')
          @query_values[1] = '0'
        end
      end
    end		      	
		      
	end

	def settings
	    @user = User.find(params[:id])
	    @db_items = RegisteredApps.all
	    c = RegisteredApps.count  
	    @query_values = Array.new(c) 
	    @id=@user.id
	    @db_items.each do |item|
	      if(item.Name.eql? "Cab Booking")
		httresponse = HTTParty.post("http://localhost:5000/queryuser_cab.json",
		  {
		    :body => @id.to_json,
		    :headers => { 'Content-Type' => 'application/json',
		    'Accept' => 'application/json' }
		  }
		)
		response = httresponse.response
		status = response.code
		if(status.eql? '200')
		  @query_values[0] = '1'
		elsif(status.eql? '404')
		  @query_values[0] = '0'
		end
	      end

	      if(item.Name.eql? "Flight Booking")
		httresponse = HTTParty.post("http://localhost:5001/queryuser_airline.json",
		  {
		    :body => @id.to_json,
		    :headers => { 'Content-Type' => 'application/json',
		    'Accept' => 'application/json' }
		  }
		)
		response = httresponse.response
		status = response.code
		if(status.eql? '200')
		  @query_values[1] = '1'
		elsif(status.eql? '404')
		  @query_values[1] = '0'
		end
	    end
	  end
	end

	def cabadd
		@user = User.find(params[:id])
		@id=@user.id
    httresponse = HTTParty.post("http://localhost:5000/adduser_cab.json",
      {
        :body => @id.to_json,
        :headers => { 'Content-Type' => 'application/json',
        'Accept' => 'application/json' }
      }
    )
    response = httresponse.response
    status = response.code
    d = httresponse.parsed_response
    if(status.eql? '201')
      redirect_to :controller=>'users', :action => 'show', :id=>@user.id
    end  
  end

	def cabdrop
		@user = User.find(params[:id])
		@id=@user.id
    httresponse = HTTParty.post("http://localhost:5000/dropuser_cab.json",
      {
        :body => @id.to_json,
        :headers => { 'Content-Type' => 'application/json',
        'Accept' => 'application/json' }
      }
    )
    response = httresponse.response
    status = response.code
    d = httresponse.parsed_response
    if(status.eql? '201')
      redirect_to :controller=>'users', :action => 'show', :id=>@user.id
    end
	end

	def flightadd
		@user = User.find(params[:id])
		@id=@user.id
		    httresponse = HTTParty.post("http://localhost:5001/adduser_airline.json",
		      {
			:body => @id.to_json,
			:headers => { 'Content-Type' => 'application/json',
			'Accept' => 'application/json' }
		      }
		    )
		    response = httresponse.response
		    status = response.code
		    d = httresponse.parsed_response
		    if(status.eql? '201')
		      redirect_to :controller=>'users', :action => 'show', :id=>@user.id
		    end  
	end

	def flightdrop
		@user = User.find(params[:id])
		@id=@user.id
		    httresponse = HTTParty.post("http://localhost:5001/dropuser_airline.json",
		      {
			:body => @id.to_json,
			:headers => { 'Content-Type' => 'application/json',
			'Accept' => 'application/json' }
		      }
		    )
		    response = httresponse.response
		    status = response.code
		    d = httresponse.parsed_response
		    if(status.eql? '201')
		      redirect_to :controller=>'users', :action => 'show', :id=>@user.id
		    end
    	end

	private
	
	def user_params
		params.require(:user).permit(:username, :email, :wpass, :first_name, :last_name, :dob, :agent_id, :post, :address, :contact, :cab, :bus, :train, :flight, :hotel, :id)
	end
end
