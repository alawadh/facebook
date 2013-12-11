class CreateUsers < ActiveRecord::Migration
  def up
      create_table :users do |t|
      	t.string :username
      	t.string :first_name
      	t.string :last_name
      	t.string :password_hash
      	t.string :password_salt
      	t.date :birthday
      	t.text :interests
      	t.text :quotes

      	t.timestamps
      end
  end
  
  def down
	drop_table :users
  end


end
