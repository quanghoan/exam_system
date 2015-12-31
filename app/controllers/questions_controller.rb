class QuestionsController < ApplicationController
  before_action :admin_user

  def new
    @question = Question.new 
    @subject = @question.subject
    4.times {@question.answers.build}
    @subjects = Subject.all 
    respond_to do |format| 
      format.html {}              
      format.js {}
    end
  end

  def index
    @questions = Question.all
    @subjects = Subject.all
  end

  def edit
    @question = Question.find(params[:id])
    @subjects = Subject.all
    @subject = @question.subject
  end

  def create   
    
    @subjects = Subject.all
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "added a question."
      redirect_to subject_path(@question.subject)      
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
    @question = Question.find(params[:id])    
    if @question.update_attributes(question_params)
      flash[:success] = "question updated."
      redirect_to questions_url
    else
      render 'edit'
    end
  end

  private

  def question_params
    params.permit(:subject_id, :content, :question_type, answers_attributes: [:id, :content, :correct_answer])
  end
end
