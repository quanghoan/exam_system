class TimeInfo < ActiveRecord::Base
	has_one :test
	belongs_to :subject
	belongs_to :user
end
