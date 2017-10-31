class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.references :boat
      t.references :job


      t.timestamps
    end
  end
end
