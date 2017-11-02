class CreateBoatsJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :boats_jobs, id: false do |t|
      t.integer :job_id, null: false
      t.integer :boat_id, null: false
    end
    add_index :boats_jobs, [:job_id, :boat_id], unique: true
  end
end
