class SessionsController < ApplicationController
  
  def new
    if current_user != nil
      redirect_to user_profile_path(current_user)
    end
  end

  def create
	user = User.authenticate(params[:username], params[:password])
	if user
		session[:user_id] = user.id
		redirect_to user_newsfeed_path(user.id), :notice => "Logged in!"
	else
		flash.now.alert = "Invalid username or password"
		render "new"
	end
  end

  def destroy
	session[:user_id] = nil
	redirect_to log_in_path, :notice => "Logged out!"
  end

end
