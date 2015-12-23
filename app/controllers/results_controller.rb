class ResultsController < ApplicationController

  def show
  end

  def create
    byebug
  	@result = Result.new(result_params)
  	if @result.save
  		flash[:success] = "ok"
  		redirect_to @result
  	else
  		flash[:danger] = "failed"
  	end
  end

  private

  def result_params
  	params.require(:test).permit(:user_id, :answer_id => [])
  end

end
