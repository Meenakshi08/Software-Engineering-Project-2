class RegisterusersController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def addcab
    @reg_user=RegisteredUsersCab.new
    @reg_user.userID = params[:_json]
    respond_to do |format|
      if @reg_user.save
        format.json { render json: @reg_user, status: :created }# code 201
      else
        format.json { render json: @reg_user, status: :precondition_failed }# code 412
      end
    end
  end
  
  def dropcab
    @u=RegisteredUsersCab.find_by_userID(params[:_json])
    respond_to do |format|
      if @u.delete
        format.json { render json: @u, status: :created }# code 201
      else
        format.json { render json: @u, status: :precondition_failed }# code 412
      end
    end
  end
  
  def querycab
    @u=RegisteredUsersCab.find_by_userID(params[:_json])
    respond_to do |format|
      if !@u.nil?
        format.json { render json: @u, status: :ok }# code 200
      else
        format.json { render json: @u, status: :not_found }# code 404
      end
    end
  end

end
