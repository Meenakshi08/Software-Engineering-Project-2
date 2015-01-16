class NextCabBookingsController < ApplicationController

def show
    customer_id = params[:id]
    user_id = params[:user_id]
    c_id=CabBooking.find_cid(customer_id,user_id)
    @cab_booking = CabBooking.next(customer_id,c_id)
    if(not @cab_booking.nil?)
      render json: @cab_booking
    elsif(@cab_booking.nil?)
      render :new
    end
  end
	def cab_params
		params.require(:cab_booking).permit!
	end
end
