class LoginsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def new
  end
    	
  def create
    @user = User.new
    @user.username = params[:username_or_email]
    @user.wpass = params[:login_password]
    
    httresponse = HTTParty.post("http://localhost:4000/authenticate_user.json",
					{			
						:body => @user.to_json,
						:headers => { 'Content-Type' => 'application/json',
						'Accept' => 'application/json' }
					}
		)
		response = httresponse.response
		status = response.code
		@user = User.new(httresponse.parsed_response)
		if(status.eql? '202')
	      redirect_to :controller=>'users', :action => 'show', :id=>@user.id
		elsif  (status.eql? '412')
    		flash.now.alert = "Invalid email or password"
        render "new"
		end
    
  end    

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end


  
end
