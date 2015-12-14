class SubjectsController < ApplicationController
  before_action :admin_user
  def new
  	@subject = Subject.new
  end

  def show
  	@subject = Subject.find(params[:id])
    @questions = @subject.questions
  end
 	 
  def index
  	@subjects = Subject.all
  end

  def edit
  	@subject = Subject.find(params[:id])
  end

  def create
  	@subject = Subject.new(subject_params)
  	if @subject.save
  		flash[:success] = "added a subject"
  		redirect_to new_question_path
  	else
  		render 'new'
  	end
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:success] = "a subject updated!"
      redirect_to @subject
    else
      render 'edit'
    end
  end

  def destroy
  	Subject.find(params[:id]).destroy  
    flash[:success] = "subject deleted!"
    redirect_to subjects_url
  end

  private

  def subject_params
  	params.require(:subject).permit(:title)
  end
end
