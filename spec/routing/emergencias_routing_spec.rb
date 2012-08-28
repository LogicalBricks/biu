require "spec_helper"

describe EmergenciasController do
  describe "routing" do

    it "routes to #index" do
      get("/emergencias").should route_to("emergencias#index")
    end

    it "routes to #new" do
      get("/emergencias/new").should route_to("emergencias#new")
    end

    it "routes to #show" do
      get("/emergencias/1").should route_to("emergencias#show", :id => "1")
    end

    it "routes to #edit" do
      get("/emergencias/1/edit").should route_to("emergencias#edit", :id => "1")
    end

    it "routes to #create" do
      post("/emergencias").should route_to("emergencias#create")
    end

    it "routes to #update" do
      put("/emergencias/1").should route_to("emergencias#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/emergencias/1").should route_to("emergencias#destroy", :id => "1")
    end

  end
end
