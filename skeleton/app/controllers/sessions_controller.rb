class SessionsController < ApplicationController
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(dem_params[:user_name], dem_params[:password])
    
    if @user
      login!(@user)
      redirect_to cats_url
    else
      flash[:errors] = ["Invalid Credentials brahhhhh"]
      redirect_to new_session_url
    end
  end
  
  def destroy
    logout!
    redirect_to new_session_url
  end
  
  private
    def dem_params
      params.require(:user).permit(:user_name, :password)
    end
end 