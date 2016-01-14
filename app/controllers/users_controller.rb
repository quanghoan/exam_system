class UsersController < ApplicationController
  before_action :admin_user, only: [:destroy, :edit, :new, :update, :index]   
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @subjects = @user.subjects
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "create new user successfully"
      redirect_to users_url
    else
      render 'new'
    end  
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated!"
      redirect_to users_url
    else
      render 'edit'
    end
  end

  def user_status
    @user = User.find(params[:id])
    if @user.update_attributes!(user_status_params)
      if @user.status 
        flash[:success] = "#{@user.name} is blocked ."
        LoginAttempt.create(user_id: @user.id)
      else
        flash[:success] = "#{@user.name} is unblocked ."  
        @user.login_attempts.first.destroy
      end
    else
      flash[:danger] = "This action is invalid ."    
    end   
    # byebug 
    redirect_to users_url 
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted!"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :address, :phone, :dob)
    end

    def user_status_params
      params.require(:user).permit(:status)
    end
end
