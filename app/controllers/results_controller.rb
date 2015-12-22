class ResultsController < ApplicationController

  def show
  end

  def create
    byebug
  	@result = Result.new(result_params)
    # Result.create(user_id:, question_id:, answer_id:)
  	if @result.save
  		flash[:success] = "ok"
  		redirect_to @result
  	else
  		flash[:danger] = "failed"
  	end
  end

  private

  def result_params
  	params.require(:test).permit(:user_id, :question_id, :answer_id)
  end

end
