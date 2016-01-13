class Subject < ActiveRecord::Base
	has_many :user_subjects, dependent: :destroy
	has_many :users, through: :user_subjects
	validates :title, presence: true
	has_many :questions, dependent: :destroy
	has_many :tests
	has_many :grades
	has_many :time_infos
	after_create :update_status

	def update_status
		self.update_attributes(status: "Ready")
	end
end
