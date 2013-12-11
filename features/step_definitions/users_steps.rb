Given /the following users exist:/ do |users_table|
  users_table.hashes.each do |auser|
  
	User.create!(auser)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  #flunk "Unimplemented"
end

Given /^I am on the login page/ do
  visit(log_in_path)
end

When(/^I type into the username field: "(.*?)"$/) do |arg1|
  fill_in "username", :with => arg1
end

Then(/^I type into the password field: "(.*?)"$/) do |arg1|
  fill_in "password", :with => arg1
end

Then(/^I should get (in)?correct login message$/) do |incorrect|

  if incorrect
	page.should have_content "Invalid username or password"
  else page.should have_content "Logged in!"
  end
  
end

Then(/^I press "(.*?)"$/) do |arg1|
  click_button(arg1)
end



