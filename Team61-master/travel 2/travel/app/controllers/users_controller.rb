class UsersController < ApplicationController
 def aboutus
render :action => 'aboutus'
end	
  
  
  def new
    @user = User.new 
  end
  
  def create
    
    @user = User.new(user_params)
    if @user.save
       redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
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

    redirect_to user_path(@user)
  end
  def cabdrop
    @user = User.find(params[:id])
    if(@user.cab==true)
    	@user.cab = !@user.cab # flop the status
    	@user.save
    end

    redirect_to user_path(@user)
  end
   def busadd
    @user = User.find(params[:id])
    if(@user.bus==false)
    	@user.bus = !@user.bus # flop the status
    	@user.save
    end

    redirect_to user_path(@user)
  end
  def busdrop
    @user = User.find(params[:id])
    if(@user.bus==true)
    	@user.bus = !@user.bus # flop the status
    	@user.save
    end

    redirect_to user_path(@user)
  end
  
  def trainadd
    @user = User.find(params[:id])
    if(@user.train==false)
    	@user.train = !@user.train # flop the status
    	@user.save
    end

    redirect_to user_path(@user)
  end
  def traindrop
    @user = User.find(params[:id])
    if(@user.train==true)
    	@user.train = !@user.train # flop the status
    	@user.save
    end

    redirect_to user_path(@user)
  end
  
  def flightadd
    @user = User.find(params[:id])
    if(@user.flight==false)
    	@user.flight = !@user.flight # flop the status
    	@user.save
    end

    redirect_to user_path(@user)
  end
  def flightdrop
    @user = User.find(params[:id])
    if(@user.flight==true)
    	@user.flight = !@user.flight # flop the status
    	@user.save
    end

    redirect_to user_path(@user)
  end
  
   def hoteladd
    @user = User.find(params[:id])
    if(@user.hotel==false)
    	@user.hotel = !@user.hotel # flop the status
    	@user.save
    end

    redirect_to user_path(@user)
  end
  def hoteldrop
    @user = User.find(params[:id])
    if(@user.hotel==true)
    	@user.hotel = !@user.hotel # flop the status
    	@user.save
    end

    redirect_to user_path(@user)
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :first_name, :last_name, :dob, :agent_id, :post, :address, :contact)
  end
end
