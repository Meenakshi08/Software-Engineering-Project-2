require 'json'

class LoginsController < ApplicationController
	skip_before_filter :verify_authenticity_token
	def new
	end

	def create
    @user = User.new(user_params)
    authorized_user = User.authenticate(params[:@user.username],params[:@user.wpass])
		respond_to do |format|
			#if authorized_user.errors.count == 0
				# by manish     @c=authorized_user.id
				# by manish     @users=User.find(@c)
			#	session[:user_id] = authorized_user.id
			#	format.json { render json: authorized_user.to_json, status: :login_success}
			#	redirect_to :controller=>'users', :action => 'show', :id=>authorized_user.id
				#redirect_to show_path(:id)
			#else
				
			#	format.json { render json: authorized_user.to_json, status: :login_failed}
				# by manish      flash.now.alert = "Invalid email or password"
				# by manish      render "new"
			#end
      
      if authorized_user      
        session[:user_id] = authorized_user.id
        format.json { render json: authorized_user.to_json, status: :login_success}
      else
        format.json { render json: authorized_user.to_json, status: :login_failed}	
      end
      
		end
    
	end

	#  def settings
	#  	@users=self.id
	#  	redirect_to :controller=>'users', :action => 'settings', :id=>@users.id
	#  end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out!"
	end

end
