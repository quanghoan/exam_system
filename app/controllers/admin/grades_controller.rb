class Admin::GradesController < ApplicationController
  before_action :admin_user
  
  def show
  	@grade = Grade.find(params[:id])
  end

  def index
  	@search = Grade.search(params[:q])
    @grades = @search.result
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
    @search_user = Grade.joins(:user).search(params[:q])
    @search_subject = Grade.joins(:subject).search(params[:q])
  end

  def destroy
  	Grade.find(params[:id]).destroy
  	flash[:danger] = "a grade deleted."
  	redirect_to admin_grades_url
  end
end
