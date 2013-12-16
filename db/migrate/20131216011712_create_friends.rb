class CreateFriends < ActiveRecord::Migration
  def up
    create_table :friends do |t|
      t.string :friend_username
      t.references :user

      t.timestamps
    end
    add_index :friends, :user_id
  end
  
  def down
	drop_table :friends
  end
end
