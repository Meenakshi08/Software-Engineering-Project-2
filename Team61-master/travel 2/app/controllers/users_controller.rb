class UsersController < ApplicationController
	skip_before_filter :verify_authenticity_token
	def aboutus
		render :action => 'aboutus'
	end

	def new
		@user = User.new
	end

	def authenticate_user
		incoming_user = User.new(user_params)
		existing_user  = incoming_user.authenticate()
		respond_to do |format|
			if(!existing_user.nil?)
				format.json { render json: existing_user.to_json, status: :accepted} # 202 is : accepted
			else			
				format.json { render json: incoming_user, status: :precondition_failed }	# code 412
			end
		end
	end

	def create
		@user = User.new(user_params)
		respond_to do |format|
			if @user.save
				format.json { render json: @user, status: :created }# code 201
			else
				format.json { render json: @user, status: :precondition_failed }# code 412
			end
		end

	end

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def settings
		@user = User.find(params[:id])
	end

	def cabadd
		@user = User.find(params[:id])
		if(@user.cab==false)
		@user.cab = !@user.cab # flop the status
		@user.save
    end
    respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created }# code 201
      else
        format.json { render json: @user, status: :precondition_failed }# code 412
      end
    end

		#redirect_to user_path(@user)
	end

	def cabdrop
		@user = User.find(params[:id])
		if(@user.cab==true)
		@user.cab = !@user.cab # flop the status
		end
		respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created }# code 201
      else
        format.json { render json: @user, status: :precondition_failed }# code 412
      end
    end
		#redirect_to user_path(@user)
	end

	def busadd
		@user = User.find(params[:id])
		if(@user.bus==false)
		@user.bus = !@user.bus # flop the status
		end
    respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created }# code 201
      else
        format.json { render json: @user, status: :precondition_failed }# code 412
      end
    end
		#redirect_to user_path(@user)
	end

	def busdrop
		@user = User.find(params[:id])
		if(@user.bus==true)
		@user.bus = !@user.bus # flop the status
		end
		respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created }# code 201
      else
        format.json { render json: @user, status: :precondition_failed }# code 412
      end
    end
		#redirect_to user_path(@user)
	end

	def trainadd
		@user = User.find(params[:id])
		if(@user.train==false)
		@user.train = !@user.train # flop the status
		end
    respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created }# code 201
      else
        format.json { render json: @user, status: :precondition_failed }# code 412
      end
    end

		#redirect_to user_path(@user)
	end

	def traindrop
		@user = User.find(params[:id])
		if(@user.train==true)
		@user.train = !@user.train # flop the status
		end
		respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created }# code 201
      else
        format.json { render json: @user, status: :precondition_failed }# code 412
      end
    end

		#redirect_to user_path(@user)
	end

	def flightadd
		@user = User.find(params[:id])
		if(@user.flight==false)
		@user.flight = !@user.flight # flop the status
		end
    respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created }# code 201
      else
        format.json { render json: @user, status: :precondition_failed }# code 412
      end
    end
		#redirect_to user_path(@user)
	end

	def flightdrop
		@user = User.find(params[:id])
		if(@user.flight==true)
		@user.flight = !@user.flight # flop the status
		end
		respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created }# code 201
      else
        format.json { render json: @user, status: :precondition_failed }# code 412
      end
    end
		#redirect_to user_path(@user)
	end

	def hoteladd
		@user = User.find(params[:id])
		if(@user.hotel==false)
		@user.hotel = !@user.hotel # flop the status
		end
    respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created }# code 201
      else
        format.json { render json: @user, status: :precondition_failed }# code 412
      end
    end
		#redirect_to user_path(@user)
	end

	def hoteldrop
		@user = User.find(params[:id])
		if(@user.hotel==true)
		@user.hotel = !@user.hotel # flop the status
		end
		respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created }# code 201
      else
        format.json { render json: @user, status: :precondition_failed }# code 412
      end
    end
		#redirect_to user_path(@user)
	end

	private

	def user_params

		params.require(:user).permit!
	end
end
