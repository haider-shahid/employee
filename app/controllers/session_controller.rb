class SessionController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    pass = params[:session][:passwrd]
    if @user && @user.authenticate(pass)
      session[:user_id] = @user.id
      flash[:success] = "Sign In Successfull"
      redirect_to user_path(@user)
    else
      flash.now[:danger] = "Something went wrong with email and password"
      render 'new'
    end
  end

  def delete
    session[:user_id] = nil
    flash[:success] = "You are successfully Loged out!"
    redirect_to login_path
  end

  def show
    flash.now[:success] = "You are successfully Loged in!"
    @user = User.find(params[:id])
  end
end