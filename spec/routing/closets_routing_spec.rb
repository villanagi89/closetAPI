require "rails_helper"

RSpec.describe ClosetsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/closets").to route_to("closets#index")
    end

    it "routes to #new" do
      expect(:get => "/closets/new").to route_to("closets#new")
    end

    it "routes to #show" do
      expect(:get => "/closets/1").to route_to("closets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/closets/1/edit").to route_to("closets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/closets").to route_to("closets#create")
    end

    it "routes to #update" do
      expect(:put => "/closets/1").to route_to("closets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/closets/1").to route_to("closets#destroy", :id => "1")
    end

  end
end
