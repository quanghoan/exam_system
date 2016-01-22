class UsersController < ApplicationController
  before_action :logged_in_user 
  before_action :correct_user
  def show
    @user = User.find(params[:id])
    @subjects = @user.subjects
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to(current_user) unless @user == current_user
  end
end
