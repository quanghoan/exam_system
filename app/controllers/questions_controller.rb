class QuestionsController < ApplicationController
  before_action :admin_user

  def new
    @question = Question.new
    @subjects = Subject.all   
  end

  def index
    @questions = Question.all
  end

  def edit
    @question = Question.find(params[:id])
    @subjects = Subject.all
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

  def destroy
    Question.find(params[:id]).destroy
    flash[:success] = "question deleted"
    redirect_to questions_url
  end

  def update
    @subjects = Subject.all 
    @question = Question.find(params[:id])
    if @question.save
      flash[:success] = "question updated."
      redirect_to questions_url
    else
      render 'edit'
    end
  end



  private

  def question_params
    params.require(:question).permit(:subject_id, :content, :question_type)
  end
end
