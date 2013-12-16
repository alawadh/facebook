class FriendrequestsController < ApplicationController
  # GET /friendrequests
  # GET /friendrequests.json
  def index
    @friendrequests = Friendrequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @friendrequests }
    end
  end

  # GET /friendrequests/1
  # GET /friendrequests/1.json
  def show
    @friendrequest = Friendrequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @friendrequest }
    end
  end

  # GET /friendrequests/new
  # GET /friendrequests/new.json
  def new
    @friendrequest = Friendrequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @friendrequest }
    end
  end

  # GET /friendrequests/1/edit
  def edit
    @friendrequest = Friendrequest.find(params[:id])
  end

  # POST /friendrequests
  # POST /friendrequests.json
  def create
    #@friendrequest = Friendrequest.new(params[:friendrequest])
    
    @user = User.find(params[:user_id])
    #@friend = Friend.new(params[:friend])
    @friendreq = @user.friendrequests.create(params[:friendrequest].permit(:futurefriend))

    respond_to do |format|
      if @friendrequest.save
        format.html { redirect_to @friendrequest, notice: 'Friendrequest was successfully created.' }
        format.json { render json: @friendrequest, status: :created, location: @friendrequest }
      else
        format.html { render action: "new" }
        format.json { render json: @friendrequest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /friendrequests/1
  # PUT /friendrequests/1.json
  def update
    @friendrequest = Friendrequest.find(params[:id])

    respond_to do |format|
      if @friendrequest.update_attributes(params[:friendrequest])
        format.html { redirect_to @friendrequest, notice: 'Friendrequest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @friendrequest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendrequests/1
  # DELETE /friendrequests/1.json
  def destroy
    @friendrequest = Friendrequest.find(params[:id])
    @friendrequest.destroy

    respond_to do |format|
      format.html { redirect_to friendrequests_url }
      format.json { head :no_content }
    end
  end
end
