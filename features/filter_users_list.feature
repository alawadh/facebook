Feature: display list of users
 
  As a concerned facebook user
  So that I can quickly add friends
  I want to search for users by their last name

Background: users have been added to database

  Given the following users exist:
  | username | first_name | last_name | password | birthday	   | interests | quotes 																			   |
  | oalawadh | Omar		  | Alawadh	  | 123456	 | 25-Nov-2008 | Real Life | Ability will enable a man to get to the top, but character will keep him from falling |
  | jghosh   | Juhi		  | Ghosh	  | 654321	 | 25-Dec-2008 | Whatever  | Life is a box of chocolates 														   |
  | lhobbs   | Lisa		  | Hobbs	  | 123123	 | 25-Jan-2009 | >.> 	   | <.< 																				   | 


  And  I am on the login page
  
#Scenario: restrict to users with specific last names
  # enter step(s) to check the 'PG' and 'R' checkboxes
  # enter step(s) to uncheck all other checkboxes
  # enter step to "submit" the search form on the homepage
  # enter step(s) to ensure that PG and R movies are visible
  # enter step(s) to ensure that other movies are not visible

#Scenario: no ratings selected
  # see assignment

#Scenario: all ratings selected
  # see assignment
