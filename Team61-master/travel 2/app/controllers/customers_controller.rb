class CustomersController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def create		
		@customer = Customer.new(customer_params)
		respond_to do |format|
			if @customer.save
				format.json { render json: @customer, status: :created }# code 201
			else
				format.json { render json: @customer, status: :precondition_failed }# code 412
			end
		end

	end
	
	def index
		@customers = Customer.all
	end
	def show
		@customer = Customer.find(params[:id])
	end
	
	def destroy
    @customer = Customer.find(params[:id])		
		respond_to do |format|
			if @customer.destroy
				format.json { render json: @customer, status: :destroyed }# code 201
			else
				format.json { render json: @customer, status: :precondition_failed }# code 412
			end
		end
	end
	
	def customer_params
		params.require(:customer).permit!
	end
	
end
