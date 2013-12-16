class CreateFriendrequests < ActiveRecord::Migration
  def up
    create_table :friendrequests do |t|
      t.string :futurefriend
      t.references :user

      t.timestamps
    end
    add_index :friendrequests, :user_id
  end
  
  def down
	drop_table :friendrequests
  end
end
