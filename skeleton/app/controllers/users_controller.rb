class UsersController < ApplicationController
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    # @user = User.find_by_credentials(dem_params[:user_name], dem_params[:password])
    @user = User.new(dem_params)
    
    if @user.save!
      login!(@user)
      redirect_to cats_url
    else
      render :new
    end
  end
  
  private
  def dem_params
    params.require(:user).permit(:user_name, :password)
  end
end