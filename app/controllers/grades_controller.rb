class GradesController < ApplicationController
  before_action :admin_user
  
  def show
  	@grade = Grade.find(params[:id])
  end

  def index
  	@grades = Grade.all
  end

  def destroy
  	Grade.find(params[:id]).destroy
  	flash[:danger] = "a grade deleted."
  	redirect_to grades_url
  end
end
