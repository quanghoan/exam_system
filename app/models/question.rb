class Question < ActiveRecord::Base
	belongs_to :test
  belongs_to :subject
  validates :subject_id, presence: true
  validates :question_type, presence: true
  validates :content, presence: true
  has_many :answers, dependent: :destroy, inverse_of: :question
  accepts_nested_attributes_for :answers
  attr_accessor :content_short, :content_multi, :content_single

  def single_check
  	self.question_type = 1
  end

  def multiple_check
  	self.question_type = 2
  end

  def short_answer
  	self.question_type = 3
  end
end
