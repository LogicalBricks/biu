require "spec_helper"

describe HotelesController do
  describe "routing" do

    it "routes to #index" do
      get("/hoteles").should route_to("hoteles#index")
    end

    it "routes to #new" do
      get("/hoteles/new").should route_to("hoteles#new")
    end

    it "routes to #show" do
      get("/hoteles/1").should route_to("hoteles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hoteles/1/edit").should route_to("hoteles#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hoteles").should route_to("hoteles#create")
    end

    it "routes to #update" do
      put("/hoteles/1").should route_to("hoteles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hoteles/1").should route_to("hoteles#destroy", :id => "1")
    end

  end
end
