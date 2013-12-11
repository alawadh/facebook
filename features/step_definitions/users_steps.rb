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
  pending # express the regexp above with the code you wish you had
end

Then(/^I type into the password field: "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be redirected to the profile page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should get an incorrect login message$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I press the log in button$/) do
  pending # express the regexp above with the code you wish you had
end



