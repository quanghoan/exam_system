class Test < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user
  has_many :questions, through: :subjects
  validates :subject_id, presence: true
end
