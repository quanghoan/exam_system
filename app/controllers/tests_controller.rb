class TestsController < ApplicationController

  def new
    # @user = User.find(params[:user_id])
    @test = Test.new
    @subject = @test.subject 
    @questions = @subject.questions.sample(20)
    redirect_to new_test_path(@test)
  end

  def index
  	@tests = Test.all
  end

  def show    
    @test = Test.find(params[:id])
    @subject = @test.subject
    @questions = @subject.questions.sample(20)
  end

  def create
  	@subject = Subject.find(params[:subject_id])
    @test = @subject.tests.new
    if @test.save     
    	flash[:success] = "test created."
    	redirect_to @test
    else
      flash[:danger] = "failed" 
    end
  end

  private

  def test_params
  	params.require(:test).permit(:subject_id)
  end
end
