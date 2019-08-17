class UsersController < ApplicationController
  before_action :set_user,only: [:show]
  before_action :require_user, only: [:show]
  before_action :require_same_user, only:[:show]

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
      if @user.save
        flash[:success] = "Sign In Successful"
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
          render 'new'
      end
  end
  def show
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:danger] = "You can not Visit other user's Profile"
      redirect_to user_path(current_user)
    end
  end
end