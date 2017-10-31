class Location < ApplicationRecord
	has_many :boats
	has_many :jobs
end
