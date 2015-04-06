require 'rails_helper'

RSpec.describe "Closets requests", :type => :request do
  before(:each) do
    # Closets.destroy_all
    User.destroy_all
    @user = User.create({
      email: "user@fake.com",
      username: "fakeUser",
      password: "fakePassword"
      })
    @closet = Closet.create(name:"Spring15", user_id: @user.id)
  end

  describe "#index" do
    it "gets all the closets at GET /closets" do
      get "/users/#{@user.id}/closets"
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json.length).to eq 1
    end
  end

  describe "#create" do
    it "it creates a new closet" do
      post "/users/#{@user.id}/closets",
      {
        closet:{
          name: "Spring15",
          user_id: @user.id
        }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
      expect(response).to be_success
      expect(response.content_type).to be Mime::JSON

      closet = JSON.parse(response.body)
      expect(closet["name"]).to eq "Spring15"
    end
  end

  describe "#show" do
    it "it shows a single closet" do
      get "/closets/#{@closet.id}"
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json["name"]).to eq "Spring15"
    end
  end
    describe 'DELETE destroy' do
    it 'destroy a closet' do
      expect {
        delete "/closets/#{@closet.id}"
      }.to change(Closet, :count).by(-1)
    end
  end
end
