class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      redirect_to current_user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_url
  end

  def createfb
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id 
    redirect_to current_user

  end

  def destroyfb
    session[:user_id] = nil
    redirect_to root_url
  end
end