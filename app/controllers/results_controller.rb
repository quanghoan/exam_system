class ResultsController < ApplicationController
  
  def new
  	@result = Result.new
  end

  def show
  end

  def create
  	@result = Result.new(result_params)
  	byebug
  	if @result.save
  		flash[:success] = "ok"
  		redirect_to @result
  	else
  		flash[:danger] = "failed"
  	end
  end

  private

  def result_params
  	params.permit(:user_id, :test_id, :question_id, :answer_id)
  end

end
