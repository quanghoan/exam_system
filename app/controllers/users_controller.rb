class UsersController < ApplicationController
  before_action :logged_in_user 
  before_action :correct_user, only: [:show]

  def show
    @user = User.find(params[:id])
    @subjects = @user.subjects
    # redirect_on_back_to login_path
  end

  # def edit
  #   @user = User.find(params[:id])
  # end

  # def update
  #   @user = User.find(params[:id])
  #   if @user.update_attributes(user_params)
  #     flash[:success] = "Your password has been updated ."
  #     redirect_to current_user
  #   else
  #     flash[:danger] = "Opps, something wrong ."
  #     render 'edit'
  #   end

  # end

  private
  
  # def user_params
  #   params.require(:user).permit(:password, :password_confirmation)  
  # end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(current_user) unless current_user?(@user)
  end
end
