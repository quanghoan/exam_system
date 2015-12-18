class TestsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @subject = Subject.find(params[:subject_id])
    @questions = @subject.questions.sample(4)
    @test = Test.new
  end

  def index
  	@tests = Test.all
  end

  def show    
    @test = Test.find(params[:id])
  end

  def create
    
    @test = Test.new(test_params)
    if @test.save     
    	flash[:success] = "submitted."
    	redirect_to @test
    else
      flash[:danger] = "failed" 
    end
  end

  private

  def test_params
  	params.require(:test).permit(:subject_id, :user_id)
  end
end
