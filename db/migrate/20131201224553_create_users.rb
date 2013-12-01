class CreateUsers < ActiveRecord::Migration
  def change
	drop_table :users
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :password
      t.date :birthday
      t.text :interests
      t.text :quotes

      t.timestamps
    end
  end
end
