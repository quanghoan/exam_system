class TestsController < ApplicationController
  before_action :logged_in_user
  def new
    @subject = Subject.find(params[:subject_id])
    @time_info = TimeInfo.find(params[:time_info_id])
    @questions = @subject.questions.sample(20)
    @test = Test.new 
  end
 
  private

  def test_params
  	params.require(:test).permit(:subject_id, :user_id, answers_attributes: [:id, :content])
  end
end
