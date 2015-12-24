class Result < ActiveRecord::Base
	belongs_to :user
	# belongs_to :question
	belongs_to :subject
	belongs_to :answer
	# has_many :answers
	#accepts_nested_attributes_for :answers

	def score_single
		
	end
end
