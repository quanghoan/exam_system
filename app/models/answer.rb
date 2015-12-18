class Answer < ActiveRecord::Base
	has_many :results
  belongs_to :question, inverse_of: :answers
  belongs_to :test
  validates :question, presence: true
  # validates :content, presence: true
  # validates :correct_answer, presence: true
  
end
