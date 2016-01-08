class TimeInfo < ActiveRecord::Base
	has_one :test
	belongs_to :subject
end
