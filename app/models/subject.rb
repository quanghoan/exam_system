class Subject < ActiveRecord::Base
	validates :title, presence: true
end
