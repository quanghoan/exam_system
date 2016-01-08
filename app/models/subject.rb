class Subject < ActiveRecord::Base
	validates :title, presence: true
	has_many :questions, dependent: :destroy
	has_many :tests
	has_many :grades
	has_many :time_infos
end
