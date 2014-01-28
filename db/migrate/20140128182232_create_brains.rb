class CreateBrains < ActiveRecord::Migration
  def change
    create_table :brains do |t|
      t.boolean :tasty
      t.integer :zombie_id
      t.timestamps
    end
    add_index :brains, :zombie_id
  end
end
