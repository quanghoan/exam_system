class Grade < ActiveRecord::Base
	serialize :short_question
	belongs_to :user
	validates :user_id, :score, presence: true
	default_scope -> {order(created_at: :desc)}
	belongs_to :subject
end
