require "spec_helper"

describe PlaysController do
  describe "routing" do

    it "routes to #index" do
      get("/plays").should route_to("plays#index")
    end

    it "routes to #new" do
      get("/plays/new").should route_to("plays#new")
    end

    it "routes to #show" do
      get("/plays/1").should route_to("plays#show", :id => "1")
    end

    it "routes to #edit" do
      get("/plays/1/edit").should route_to("plays#edit", :id => "1")
    end

    it "routes to #create" do
      post("/plays").should route_to("plays#create")
    end

    it "routes to #update" do
      put("/plays/1").should route_to("plays#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/plays/1").should route_to("plays#destroy", :id => "1")
    end

  end
end
