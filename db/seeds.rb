# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'oalawadh', first_name: 'Omar', last_name: 'Alawadh', password: '123456', birthday: '25-Nov-2008', interests: 'Real Life', quotes: 'Ability will enable a man to get to the top, but character will keep him from falling') 
User.create(username: 'jghosh', first_name: 'Juhi', last_name: 'Ghosh', password: '654321', birthday: '25-Dec-2008', interests: 'Whatever', quotes: 'Life is a box of chocolates') 
User.create(username: 'lhobbs', first_name: 'Lisa', last_name: 'Hobbs', password: '123123', birthday: '25-Jan-2009', interests: '>.>', quotes: '<.<') 
