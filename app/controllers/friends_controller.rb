class FriendsController < ApplicationController
  # GET /friends
  # GET /friends.json
  def index
    @friends = Friend.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @friends }
    end
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
    @friend = Friend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @friend }
    end
  end

  # GET /friends/new
  # GET /friends/new.json
  def new
    @friend = Friend.new
    
    if params[:add_button]
		render "create"
	end

    #respond_to do |format|
     # format.html # new.html.erb
      #format.json { render json: @friend }
    #end
  end

  # GET /friends/1/edit
  def edit
    @friend = Friend.find(params[:id])
  end

  # POST /friends
  # POST /friends.json
  def create
  #@current_user.friends.push(@friend)
    @user = User.find(params[:user_id])
    #@friend = Friend.new(params[:friend])
    @friend = @user.friend.create(params[:friend].permit(:friend_username))

    #respond_to do |format|
      #if @friend.save
      if params[:add_button]
        format.html { redirect_to @friend, notice: 'Friend was successfully created.' }
        format.json { render json: @friend, status: :created, location: @friend }
      else
        format.html { render action: "new" }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end

  # PUT /friends/1
  # PUT /friends/1.json
  def update
    @friend = Friend.find(params[:id])

    respond_to do |format|
      if @friend.update_attributes(params[:friend])
        format.html { redirect_to @friend, notice: 'Friend was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to friends_url }
      format.json { head :no_content }
    end
  end
end
