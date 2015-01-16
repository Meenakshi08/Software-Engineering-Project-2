class BookingsController < ApplicationController

skip_before_filter :verify_authenticity_token

def create		
	@booking = Booking.new(cab_params)
	respond_to do |format|
		if @booking.save
			format.json { render json: @booking, status: :created }# code 201
		else
			format.json { render json: @booking, status: :precondition_failed }# code 412
		end
	end

end

def update
  @booking = Booking.find(params[:id])
  @booking.source=params[:source]
  @booking.destination=params[:destination]
  @booking.pickup_date=params[:pickup_date]
  @booking.pickup_time=params[:pickup_time]
  
  respond_to do |format|
    if @booking.update_attributes(@booking.attributes)
      format.json { render json: @booking, status: :created }# code 201
    else
      format.json { render json: @booking, status: :precondition_failed }# code 412
    end
  end

end
	
def index
	@bookings = Booking.all
end

def show
  @booking = Booking.find(params[:id])
end

	private
	def cab_params
		params.require(:booking).permit!
	end

end
