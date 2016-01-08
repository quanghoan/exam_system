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

  def create    
    if !params[:answers_attributes].nil? && !params[:answers_attributes][:i].nil?
      index = params[:answers_attributes][:i][:correct_answer]
      correct_index = params[:answers_attributes][index]
      correct_index = correct_index.update({correct_answer: true})
      params[:answers_attributes].delete(:i)
    end  
    @subjects = Subject.all
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

  private

  def question_params
    params.permit(:subject_id, :content, :question_type, answers_attributes: [:id, :content, :correct_answer])
  end
end
