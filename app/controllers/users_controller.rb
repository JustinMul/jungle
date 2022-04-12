class UsersController < ApplicationController
  def new
  end
  
  def create
    user = User.new(user_params)
    # @user_error = user.errors
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      # render 'new'
      
      redirect_to '/signup'
    end
  end
  private
  
  def user_params
    params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation)
  end
end