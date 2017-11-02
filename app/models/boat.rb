class Boat < ApplicationRecord
  # validate name is unique
  validates :name, :uniqueness => true
  has_many :jobs
  
  belongs_to :user, required: false
  has_many :locations
end
