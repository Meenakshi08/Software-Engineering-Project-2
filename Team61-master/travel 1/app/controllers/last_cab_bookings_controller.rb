class LastCabBookingsController < ApplicationController
	def show
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
