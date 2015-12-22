class Result < ActiveRecord::Base
	belongs_to :user
	belongs_to :question
	belongs_to :answer
	# validates :user_id, presence: true
end
