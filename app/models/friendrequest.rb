class Friendrequest < ActiveRecord::Base
  belongs_to :user
  attr_accessible :futurefriend, :user
  
  def self.sendreq(fuser, current)
	fuser.friendrequests.create(futurefriend: current.username)
  end
  
  def self.remove(freq)
	Friendrequest.destroy(freq.id)
  end
  
end
