class TestsController < ApplicationController

  def index
  	@tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def create
  	@subject = Subject.find(params[:subject_id])
    @questions = @subject.questions.sample(10)
    @test = @questions.test
  	if @test.save
  		flash[:success] = "test created."
  		redirect_to @test
  	else
  		render 'new'
  	end
  end

  private

  def test_params
  	params.require(:test).permit(:subject_id)
  end
end
