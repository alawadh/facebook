class SessionsController < ApplicationController
  
  def new
  end

  def create
	user = User.authenticate(params[:username], params[:password])
	if user
		session[:user_id] = user.id
		redirect_to user_login_path(user), :notice => "Logged in!"
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
