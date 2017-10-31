class Job < ApplicationRecord
	has_many :boats
	has_many :locations

	validates :description, presence: true, length: {minimum: 50}
    validates :cost, numericality: { :greater_than => 1000, :less_than_or_equal_to => 999999999}

end
