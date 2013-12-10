Given /the following users exist:/ do |users_table|
  users_table.hashes.each do |auser|
  
	User.create!(auser)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  #flunk "Unimplemented"
end

Given /^I am on the login page/ do
  visit(login_path)
end
