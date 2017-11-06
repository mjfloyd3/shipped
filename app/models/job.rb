class Job < ApplicationRecord
	belongs_to :user
	has_and_belongs_to_many :locations, required: false

	# a boat can be in many jobs, a job can have many boats
	has_and_belongs_to_many :boats, required: false

	validates :description, presence: true, length: {minimum: 50}
  validates :cost, numericality: { :greater_than => 1000, :less_than_or_equal_to => 999999999}

end
