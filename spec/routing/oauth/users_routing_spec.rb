require "rails_helper"

RSpec.describe Oauth::UsersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/oauth/users").to route_to("oauth/users#index")
    end

    it "routes to #new" do
      expect(:get => "/oauth/users/new").to route_to("oauth/users#new")
    end

    it "routes to #show" do
      expect(:get => "/oauth/users/1").to route_to("oauth/users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/oauth/users/1/edit").to route_to("oauth/users#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/oauth/users").to route_to("oauth/users#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/oauth/users/1").to route_to("oauth/users#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/oauth/users/1").to route_to("oauth/users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/oauth/users/1").to route_to("oauth/users#destroy", :id => "1")
    end

  end
end
