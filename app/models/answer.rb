class Answer < ActiveRecord::Base
	has_many :results
  belongs_to :question, inverse_of: :answers
  belongs_to :test
  validates :content, presence: true
  #validates :correct_answer, presence: true

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
