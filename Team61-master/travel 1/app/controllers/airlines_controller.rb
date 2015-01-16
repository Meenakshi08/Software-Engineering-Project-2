class AirlinesController < ApplicationController


def create
		#user_id = params[:id]
		@airline = Airline.new(airline_params)
		@airline.user_id=params[:user_id]
		@airline.airline_name=params[:airline_name]
	
		httresponse = HTTParty.post("http://localhost:5001/airlines/create.json",
					{			
						:body => @airline.to_json,
						:headers => { 'Content-Type' => 'application/json',
						'Accept' => 'application/json' }
					}
		)
		response = httresponse.response
		status = response.code
		@airline = Airline.new(httresponse.parsed_response)
		if(status.eql? '201')
			redirect_to :controller=>'users', :action => 'show', :id=>@airline.user_id, :notice => "Added!"
		elsif  (status.eql? '412')
			render :new
		end	
		
	end

private

	def airline_params
		 params.permit(:user_id,:airline_name)
end

end

