require "spec_helper"

describe TransportesController do
  describe "routing" do

    it "routes to #index" do
      get("/transportes").should route_to("transportes#index")
    end

    it "routes to #new" do
      get("/transportes/new").should route_to("transportes#new")
    end

    it "routes to #show" do
      get("/transportes/1").should route_to("transportes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/transportes/1/edit").should route_to("transportes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/transportes").should route_to("transportes#create")
    end

    it "routes to #update" do
      put("/transportes/1").should route_to("transportes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/transportes/1").should route_to("transportes#destroy", :id => "1")
    end

  end
end
