class QuestionsController < ApplicationController
  def new
    @question = Question.new
    @subjects = Subject.all   
  end

  def index
    @questions = Question.all
  end

  def destroy
    Question.find(params[:id]).destroy
    flash[:success] = "question deleted"
    redirec_to questions_url
  end

  def show
  end

  def create
    @subjects = Subject.all
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "added a question."
      redirect_to questions_url
    else
      render 'new'
    end
  end

  def update
  end

  def edit
  end

  private

  def question_params
    params.require(:question).permit(:subject_id, :content, :question_type)
  end
end
