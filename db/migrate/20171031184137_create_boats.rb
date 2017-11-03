class CreateBoats < ActiveRecord::Migration[5.1]
  def change
    create_table :boats do |t|
      t.string :name
      t.integer :containers
      t.string :location
      t.integer :started_at
      
      t.references :location, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps

    end
  end
end
