class Boat < ApplicationRecord
	has_many :jobs
	belongs_to :user
	has_many :locations
end
