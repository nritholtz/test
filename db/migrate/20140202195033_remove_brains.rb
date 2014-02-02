class RemoveBrains < ActiveRecord::Migration
  def change
  	drop_table :brains
  end
end
