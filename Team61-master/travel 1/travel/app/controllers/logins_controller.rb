class LoginsController < ApplicationController
  def new
  end
    

	
  def create
    authorized_user = User.authenticate(params[:username_or_email],params[:login_password])  
    if authorized_user      
      #redirect_to root_url, :notice => "Logged in!"
      @c=authorized_user.id
      @users=User.find(@c) 
      session[:user_id] = authorized_user.id
      redirect_to :controller=>'users', :action => 'show', :id=>@users.id
     #redirect_to home_path(:id)
    else
      flash.now.alert = "Invalid email or password"
      render "new"	
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
