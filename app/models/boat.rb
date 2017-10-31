class Boat < ApplicationRecord
  # validate name is unique
  validates :name, :uniqueness => true
  has_many :jobs
	belongs_to :user
  belongs_to :job
	has_many :locations
end
