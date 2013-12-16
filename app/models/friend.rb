class Friend < ActiveRecord::Base
  belongs_to :user
  attr_accessible :friend_username, :user
end
