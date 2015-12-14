class Subject < ActiveRecord::Base
	validates :title, presence: true
	has_many :questions
	has_many :tests
end
