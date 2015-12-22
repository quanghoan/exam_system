class Test < ActiveRecord::Base
	has_many :results
  belongs_to :subject
  belongs_to :user
  has_many :answers
  has_many :questions, through: :subjects
  validates :subject_id, presence: true 
end
