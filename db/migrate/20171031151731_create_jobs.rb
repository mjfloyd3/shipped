class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :description
      t.string :origin
      t.string :destination
      t.integer :cost
      t.integer :containers
      t.string :boat
      t.references :boat, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
