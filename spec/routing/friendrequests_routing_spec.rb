require "spec_helper"

describe FriendrequestsController do
  describe "routing" do

    it "routes to #index" do
      get("/friendrequests").should route_to("friendrequests#index")
    end

    it "routes to #new" do
      get("/friendrequests/new").should route_to("friendrequests#new")
    end

    it "routes to #show" do
      get("/friendrequests/1").should route_to("friendrequests#show", :id => "1")
    end

    it "routes to #edit" do
      get("/friendrequests/1/edit").should route_to("friendrequests#edit", :id => "1")
    end

    it "routes to #create" do
      post("/friendrequests").should route_to("friendrequests#create")
    end

    it "routes to #update" do
      put("/friendrequests/1").should route_to("friendrequests#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/friendrequests/1").should route_to("friendrequests#destroy", :id => "1")
    end

  end
end
