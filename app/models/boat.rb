class Boat < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  # validate name is unique
  validates :name, :uniqueness => true

  # a boat can be in many jobs, a job can have many boats
  has_and_belongs_to_many :jobs

	belongs_to :user, required: false
	has_many :locations

  #  Check if boat is alredy assigned to a specific job
  def assigned_in?(job)
    self.jobs.include?(job)
  end
  # check the jobs the boat is not assigned to
  def unassigned_jobs
    Job.all - self.jobs
  end

end
