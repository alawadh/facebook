class Friend < ActiveRecord::Base
  belongs_to :user
  attr_accessible :friend_username, :user
  
  def self.add(fuser, current)
	current.friends.create(friend_username: fuser.username)
	fuser.friends.create(friend_username: current.username)
  end
  
  def self.remove(friend, current)
    @friendname = friend.friend_username
    @seconduser = User.find_by_username(@friendname)
    @seconduser.friends.each do |fr|
		if fr.friend_username == current.username
			@secondfrid = fr.id
		end
	end
	@seconduser.friends.destroy(@secondfrid)
	current.friends.destroy(friend.id)
  end
	
  
end
