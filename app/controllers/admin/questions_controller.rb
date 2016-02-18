class Admin::QuestionsController < ApplicationController
  before_action :admin_user

  def new
    @question = Question.new 
    @subjects = Subject.all 
  end

  def new3
    @question = Question.new  
    @subjects = Subject.all 
  end

  def new2
    @question = Question.new 
    @subjects = Subject.all 
  end

  def index
    @questions = Question.paginate(page: params[:page], per_page: 6)
    @subjects = Subject.all
  end  

  def create  
    #byebug   
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
      redirect_to admin_subject_path(@question.subject)      
    else
      # byebug
      if params[:question_type].to_i == 1
        render 'new'
      elsif params[:question_type].to_i == 2 
        render 'new2'
      elsif params[:question_type].to_i == 3
        render 'new3'
      end
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    flash[:success] = "question deleted"
    redirect_to admin_questions_url
  end

  private

  def question_params
    params.permit(:subject_id, :content, :question_type, :picture, answers_attributes: [:id, :content, :correct_answer])
  end
end
