class BookingsController < ApplicationController
skip_before_filter :verify_authenticity_token

def create		
	@booking = Booking.new(airline_params)
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
  @booking.flight_no=params[:flight_no]
  @booking.departure_time=params[:departure_time]
   @booking.total_fare=params[:total_fare]
   @booking.airline_id=params[:airline_id]
  respond_to do |format|
    if @booking.update_attributes(@booking.attributes)
      format.json { render json: @booking, status: :created }# code 201
    else
      format.json { render json: @booking, status: :precondition_failed }# code 412
    end
  end

end
	
def index
	@Bookings = Booking.all
end

def show
  @booking = Booking.find(params[:id])
end

	private
	def airline_params
		params.require(:booking).permit!
	end

end
