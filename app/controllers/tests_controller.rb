class TestsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user
  def new
    @time_info = TimeInfo.find(params[:time_info_id])
    @subject = Subject.find(params[:subject_id])
    @questions = @subject.questions.sample(20)
    @test = Test.new 
  end
 
  private

  def test_params
  	params.require(:test).permit(:subject_id, :user_id, answers_attributes: [:id, :content])
  end

  def correct_user
    @subject = Subject.find(params[:subject_id])
    @time_info = TimeInfo.find(params[:time_info_id])
    unless (@subject == @time_info.subject)
      redirect_to new_test_path(time_info_id: @time_info.id, subject_id: @time_info.subject_id)
    end 
  end
end
