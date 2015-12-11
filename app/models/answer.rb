class Answer < ActiveRecord::Base
  belongs_to :question, inverse_of: :answers
  validates :question, presence: true
  validates :content, presence: true
  # validates :correct_answer, presence: true
end
