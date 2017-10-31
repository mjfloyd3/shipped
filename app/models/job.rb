class Job < ApplicationRecord
	has_many :boats
	has_many :locations
	

end
