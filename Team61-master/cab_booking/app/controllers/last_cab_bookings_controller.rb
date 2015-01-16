class LastCabBookingsController < ApplicationController
	
	def show
 	 @booking = Booking.find(params[:id])
	end
	private
	def cab_params
		params.require(:booking).permit!
	end
end
