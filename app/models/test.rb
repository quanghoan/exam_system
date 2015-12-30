class Test < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers
  has_many :questions, through: :subjects
  validates :subject_id, presence: true 
end
