class CreatePlanes < ActiveRecord::Migration
  def change
    create_table :planes do |t|
      t.string :identifier
      t.string :model
      t.integer :serial_number
      t.string :base
      t.integer :user_id 

      t.timestamps null: false
    end
  end
end
