class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      if user.admin?
        flash[:success] = "Welcome Admin." 
        redirect_to root_url
      else 
        flash[:success] = "Hi #{user.name}"
        redirect_to current_user
      end  
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # def create
  #   user = User.find_by(email: params[:session][:email].downcase)
  #   if user && user.authenticate(params[:session][:password])
  #     if user.login_limit?
  #       flash[:danger] = "Sorry, you can not login again. Contact Admin for more details"
  #       redirect_to login_url
  #     else
  #       log_in user
  #       remember user
  #       if user.admin?
  #         flash[:success] = "Welcome Admin." 
  #         redirect_to admin_subjects_url
  #       else 
  #         LoginAttempt.create(user_id: user.id)
  #         flash.now[:success] = "Hi #{user.name}"
  #         redirect_to current_user
  #       end  
  #     end
  #   else
  #     flash.now[:danger] = 'Invalid email/password combination'
  #     render 'new'
  #   end
  # end

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