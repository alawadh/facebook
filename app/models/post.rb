class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :date_time, :wall_id, :wall_post, :user
end
