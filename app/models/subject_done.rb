class SubjectDone < ActiveRecord::Base
	belongs_to :user
	belongs_to :subject
	after_create :update_status_subject
	after_create :update_status_user

	def update_status_subject
		self.subject.update_attributes(status: "Finish")
	end

	def update_status_user
		self.user.update_attributes(status: true)
	end
end
