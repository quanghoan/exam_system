class ResultsController < ApplicationController

  def show
  end

  def create
    byebug
  	@result = Result.new(result_params)
  	if @result.save
  		flash[:success] = "your test submitted."
  		redirect_to @result
  	else
  		flash[:danger] = "failed"
  	end
  end

  private

  def result_params
  	params.require(:test).permit(:user_id,:subject_id, :answers_id)
  end
end
