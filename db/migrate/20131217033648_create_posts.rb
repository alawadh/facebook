class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.datetime :date_time
      t.text :wall_post
      t.integer :wall_id
      t.references :user

      t.timestamps
    end
    add_index :posts, :user_id
  end
  
  def down
	drop_table :posts
  end
  
end
