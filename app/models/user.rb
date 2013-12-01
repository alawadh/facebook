class User < ActiveRecord::Base
  attr_accessible :birthday, :first_name, :interests, :last_name, :password, :quotes, :username
end
