require "spec_helper"

describe RestaurantesController do
  describe "routing" do

    it "routes to #index" do
      get("/restaurantes").should route_to("restaurantes#index")
    end

    it "routes to #new" do
      get("/restaurantes/new").should route_to("restaurantes#new")
    end

    it "routes to #show" do
      get("/restaurantes/1").should route_to("restaurantes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/restaurantes/1/edit").should route_to("restaurantes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/restaurantes").should route_to("restaurantes#create")
    end

    it "routes to #update" do
      put("/restaurantes/1").should route_to("restaurantes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/restaurantes/1").should route_to("restaurantes#destroy", :id => "1")
    end

  end
end
