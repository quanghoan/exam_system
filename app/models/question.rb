class Question < ActiveRecord::Base
  belongs_to :subject
  validates :subject_id, presence: true
  validates :question_type, presence: true
  validates :content, presence: true
  has_many :answers, dependent: :destroy, inverse_of: :question
  accepts_nested_attributes_for :answers
end
