class QuestionsController < ApplicationController
  before_action :admin_user

  def new
    @question = Question.new 
    @subject = @question.subject 
    @subjects = Subject.all 
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
    index = params[:answers_attributes][:i][:correct_answer]
    correct_index = params[:answers_attributes][index]
    correct_index = correct_index.update({correct_answer: true})
    params[:answers_attributes].delete(:i)
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "Added a question."
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
