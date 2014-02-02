class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :message, limit:40
      t.integer :zombie_id

      t.timestamps
    end
    add_index :tweets, :zombie_id
  end
end
