class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  def newsfeed
    @user = User.find(params[:id])
    @data = Post.find(:all, :conditions => { :wall_id => @user.id })
    @user.friends.each do |fr|
      @fruser = User.find_by_username(fr.friend_username)
      @data += Post.find(:all, :conditions => { :wall_id => @fruser.id })
    end
    @posts = @data.sort_by {|apost| apost.date_time}.reverse
  end
  
  def profile
	@user = User.find(params[:id])
	if @user == current_user
	  @flag = 1
	end
	current_user.friends.each do |fr|
	  if fr.friend_username == @user.username
	    @flag = 1
	  end
	end
	
	@posts = Post.find(:all, :conditions => { :wall_id => params[:id] })
	@posts = @posts.sort_by {|apost| apost.date_time}.reverse
	
	
    if params[:Add]
	  #@uzer = User.find_by_id(((params["Add"]).first)[0])
	  #flash.now.alert = @user.id
	  Friendrequest.sendreq(@user, current_user)
	  #redirect_to user_path(current_user)
	  flash.now.alert = 'Sent a friends request'
	end
	
	if params[:submit_button]
	  #@uzer = User.find_by_id(((params["Add"]).first)[0])
	  #flash.now.alert = @user.id
	  flash.now.alert = 'Posted'
	  current_user.posts.create(:date_time => Time.now, :wall_id => params[:id], :wall_post => params[:wall_post])
	  #redirect_to user_path(current_user)
	  flash.now.alert = 'Posted'
	  redirect_to user_profile_path(@user)
	end
	
	    
  end
  
  def search
    #@users = User.find_by_last_name(params[:last_name])
    #@users = User.where(:lastname => params[:last_name])
    @users = User.find(:all, :conditions => { :last_name => params[:last_name]})
    #@user = User.new
    
    if params[:search_button]
		#redirect_to user_path(@users), :notice => "Found the user!"
	  if @users.length > 0
		render "search"
	  else
	    flash.now.alert = "Search returned no results"
		render "search"
	  end
	end
	
	if params[:Add]
	  @user = User.find_by_id(((params["Add"]).first)[0])
	  #flash.now.alert = @user.id
	  Friendrequest.sendreq(@user, current_user)
	  #redirect_to user_profile_path(current_user)
	  flash.now.alert = 'Sent a friends request'
	end
  end

  def login
    @user = User.new
  end 
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
	
    #respond_to do |format|
     # format.html # show.html.erb
     # format.json { render json: @user }
    #ends
    
    if params[:Remove]
	  @friend = Friend.find_by_id(((params["Remove"]).first)[0])
	  Friend.remove(@friend, current_user)
	  redirect_to user_path(params[:id])
    end
    
    if params[:Accept]
	  @friendreq = Friendrequest.find_by_id(((params["Accept"]).first)[0])
	  @sendinguser = User.find_by_username(@friendreq.futurefriend)
	  Friend.add(@sendinguser, current_user)
	  Friendrequest.remove(@friendreq)
	  redirect_to user_path(params[:id])
	  #Friendrequest.send(@friendreq)
	  #redirect_to user_path(params[:id])
	end

    if params[:Decline]
	  @friendreq = Friendrequest.find_by_id(((params["Decline"]).first)[0])
	  Friendrequest.remove(@friendreq)
	  redirect_to user_path(params[:id])
	end	
		
    if params[:clear_button]
	  @posts = Post.find(:all, :conditions => { :wall_id => current_user.id })
	  @posts.each do |apost|
		Post.destroy(apost.id)
	  end
	  redirect_to user_profile_path(@user)
	end
	
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to log_in_path, notice: 'Signed up!' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
