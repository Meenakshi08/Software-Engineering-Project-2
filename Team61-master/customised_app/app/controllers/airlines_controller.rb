class AirlinesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def create
    @airline_booking_apps = AirlineBookingApps.new(user_params)
	@airline_booking_apps.user_id= params[:user_id]
    respond_to do |format|
      if @airline_booking_apps.save
        format.json { render json: @airline_booking_apps, status: :created }# code 201
       # $airline_booking_apps_id = AirlineBookingApps.find(@airline_booking_apps.user_id)
        @airline_id=AirlineBookingApps.last.id
        @airline_booking_apps_airlines = AirlineBookingAppsAirlines.new(:airline_booking_app_id=>@airline_id, :airline_id=>params[:airline_name].to_s)
        @airline_booking_apps_airlines.save
      else
        format.json { render json: @airline_booking_apps, status: :precondition_failed }# code 412
      end
    end

    
   # @airline_booking_apps_airlines.airline_booking_app_id=@airline_id
   # @airline_booking_apps_airlines.airline_id= params[:airline_name]
  end
  
  def dropuser
    @u=AirlineBookingApps.find_by_user_id(params[:_json])
    respond_to do |format|
      if @u.delete
        format.json { render json: @u, status: :created }# code 201
      else
        format.json { render json: @u, status: :precondition_failed }# code 412
      end
    end
  end
  
  def queryuser
    @u=AirlineBookingApps.find_by_user_id(params[:_json])
    respond_to do |format|
      if !@u.nil?
        format.json { render json: @u, status: :ok }# code 200
      else
        format.json { render json: @u, status: :not_found }# code 404
      end
    end
  end
  
  
  
  
  
def search
  user_id=params[:id]  
  @airline_booking_apps = AirlineBookingApps.find_by(user_id: user_id)
  appid=@airline_booking_apps['id']
  @airlineobject=AirlineBookingAppsAirlines.find_by(airline_booking_app_id: appid)
  @airline_names=@airlineobject['airline_id']
 
  @tosend=AirlineBookingAppsAirlines.new(:airline_booking_app_id=> appid, :airline_id=>@airlineobject['airline_id'])
 
  end
  def user_params
    params.permit(:user_id)
  end

  def airline_params
    params.permit(:airline_name,:airline_booking_app_id)
  end
end
