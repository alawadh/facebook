# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'

  # MySQL and PostgreSQL
  #ActiveRecord::Base.connection.execute("TRUNCATE #{table}")

  # SQLite
  ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
end

user1 = User.create(username: 'oalawadh', first_name: 'Omar', last_name: 'Alawadh', password: '123456', birthday: '25-Nov-2008', interests: 'Real Life', quotes: 'Ability will enable a man to get to the top, but character will keep him from falling') 
user2 = User.create(username: 'jghosh', first_name: 'Juhi', last_name: 'Ghosh', password: '654321', birthday: '25-Dec-2008', interests: 'Whatever', quotes: 'Life is a box of chocolates') 
user3 = User.create(username: 'lhobbs', first_name: 'Lisa', last_name: 'Hobbs', password: '123123', birthday: '25-Jan-2009', interests: '>.>', quotes: '<.<')
user4 = User.create(username: 'aalsanaa', first_name: 'Adnan', last_name: 'AlSanaa', password: '000000', birthday: '25-Jun-1990', interests: 'hi', quotes: 'bye')
user5 = User.create(username: 'jspurgeon', first_name: 'Justin', last_name: 'Spurgeon', password: 'abcdef', birthday: '15-May-1989', interests: 'Kurry', quotes: 'Kebob')
user6 = User.create(username: 'malawadh', first_name: 'Maha', last_name: 'Alawadh', password: '2480', birthday: '25-Nov-2008', interests: 'Real Life', quotes: 'Ability will enable a man to get to the top, but character will keep him from falling') 


#user2.friends.create(user: user1)
#user3.friends.create(user: user1)

user1.friends.create(friend_username: 'jghosh')
user1.friends.create(friend_username: 'lhobbs')
