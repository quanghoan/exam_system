class Answer < ActiveRecord::Base
	has_many :results
  belongs_to :question
  belongs_to :test
  
  def single
		self.question.single_check
	end

	def multiple
		self.question.multiple_check
	end

	def short
		self.question.short_answer
	end
end
