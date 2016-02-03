class Subject < ActiveRecord::Base
	has_many :subject_dones, dependent: :destroy
	has_many :user_subjects, dependent: :destroy
	has_many :users, through: :user_subjects
	validates :title, presence: true
	validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
	has_many :questions, dependent: :destroy
	has_many :tests, dependent: :destroy
	has_many :grades, dependent: :destroy
	has_many :time_infos, dependent: :destroy
	after_create :update_status

	def update_status
		self.update_attributes(status: "Ready")
	end
end
