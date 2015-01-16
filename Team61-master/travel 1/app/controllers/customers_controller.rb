class CustomersController < ApplicationController

	def index
		@customers = Customer.all
	end
	
	def create
		user_id = params[:id]
		@customer = Customer.new(customer_params)
		@customer.user_id= user_id
		httresponse = HTTParty.post("http://localhost:4000/customers/create.json",
					{			
						:body => @customer.to_json,
						:headers => { 'Content-Type' => 'application/json',
						'Accept' => 'application/json' }
					}
		)
		response = httresponse.response
		status = response.code
		@customer = Customer.new(httresponse.parsed_response)
		if(status.eql? '201')
			redirect_to :controller=>'users', :action => 'show', :id=>@customer.user_id, :notice => "Customer "+@customer.id.to_s+" created!"
		elsif  (status.eql? '412')
			render :new
		end	
		
	end
	
 	def show
    		customer_id = params[:id]
    		user_id = params[:user_id]
    		
    		@customer = Customer.find(customer_id,user_id)
    		render json: @customer
  	end
    
	def destroy
    customer_id = params[:id]
    user_id = params[:user_id]
    @customer = Customer.delete(customer_id,user_id)
    redirect_to :controller=>'users', :action => 'show', :id=>user_id, :notice => "Customer deleted!"
	end
    

	private

	def customer_params
		params.require(:customer).permit!
	end

end
