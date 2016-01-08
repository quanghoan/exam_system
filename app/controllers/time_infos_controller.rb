class TimeInfosController < ApplicationController
  def create
    @time_info = TimeInfo.new(time_info_params)
  	if @time_info.save
  		redirect_to new_test_path(time_info_id: @time_info.id, subject_id: @time_info.subject_id )
  	else
  		flash[:danger] = "Can't start test, plz try again"
  		redirect_to current_user
  	end
  end 

  private

  def time_info_params
  	params.require(:time_info).permit(:start_time, :subject_id)
  end
end
