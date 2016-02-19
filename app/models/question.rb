class Question < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  has_many :results
	has_many :tests
  belongs_to :subject
  validates :subject_id, presence: true
  validates :question_type, presence: true
  validates :content, presence: true
  has_many :answers, dependent: :destroy, inverse_of: :question
  accepts_nested_attributes_for :answers, reject_if: proc { |attributes| attributes['content'].blank? }

  def single_check
  	self.question_type == 1
  end

  def multiple_check
  	self.question_type == 2
  end

  def short_answer
  	self.question_type == 3
  end

  validate  :picture_size

  private
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
