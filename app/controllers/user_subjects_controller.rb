class UserSubjectsController < ApplicationController
	before_action :admin_user
	def show
		@users = User.all 
		@subject = Subject.find(params[:id])
	end

	def update
		@subject = Subject.find(params[:id])
		if @subject.update_attributes(user_subject_params)
			flash[:success] = "update user to test successfully !"
		else
			flash[:danger] = "I'm sorry, something wrong."
		end
		redirect_to subjects_url
	end

	private

	def user_subject_params
		params.require(:subject).permit(user_ids: [])
	end
end
