class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :description
      t.string :origin
      t.string :destination
      t.integer :cost
      t.integer :containers
      
      t.references :user, foreign_key: true
      t.references :location, foreign_key: true
      t.timestamps
    end
  end
end
