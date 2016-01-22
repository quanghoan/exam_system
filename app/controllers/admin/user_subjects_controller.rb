class Admin::UserSubjectsController < ApplicationController
	before_action :admin_user
	def show
		@users = User.where(admin: false)
		@subject = Subject.find(params[:id])
	end

	def update
		@subject = Subject.find(params[:id])
		if @subject.update_attributes(user_subject_params)
			flash[:success] = "update user to test successfully !"
		else
			flash[:danger] = "I'm sorry, something wrong."
		end
		redirect_to admin_subjects_url
	end

	def add_user
		@subjects = Subject.all 
		@user = User.find(params[:id])
	end

	def update_user
		@user = User.find(params[:id])
		if @user.update_attributes(update_user_params)
			flash[:success] = "Update subject to user successfully !"
		else
			flash[:danger] = "I'm sorry, something wrong."
		end
		redirect_to admin_users_url
	end

	private

	def user_subject_params
		params.require(:subject).permit(user_ids: [])
	end

	def update_user_params
		params.require(:user).permit(subject_ids: [])
	end
end