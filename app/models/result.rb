class Result < ActiveRecord::Base
	belongs_to :user
	belongs_to :question
	belongs_to :subject
	belongs_to :answer
	#accepts_nested_attributes_for :answers
end
