require 'rails_helper'

RSpec.describe "Articles requests", :type => :request do
  before(:each) do
    Article.destroy_all
    Closet.destroy_all
    User.destroy_all
    @user = User.create({
      email: "user@fake.com",
      username: "fakeUser",
      password: "fakePassword"
      })
    @closet = Closet.create(name:"Spring15", user_id: @user.id)
    @article = Article.create(name:"Blue skirt", article_type:1, category:2, closet_id:@closet.id, favorite:false)
  end

  describe "GET /articles" do
    it "gets all the articles that belong to a closet" do
      get "/closets/#{@closet.id}/articles"
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json.length).to eq 1
    end
  end

  describe "GET/articles" do
    it "gets all the articles that belong to a user" do
      get "/users/#{@user.id}/articles"
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json.length).to eq 1
    end
  end

  describe "#create" do
    it 'creates a new article' do
      post "/closets/#{@closet.id}/articles/",
      {
        article:{
          name: "Blue skirt",
          url: "",
          article_type: 1 ,
          category: 2,
          closet_id: @closet.id,
          favorite: false

          }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
      expect(response).to be_success
      expect(response.content_type).to be Mime::JSON

      comment = JSON.parse(response.body)
      expect(comment["name"]).to eq "Blue skirt"
    end
  end
  describe '#update' do
    it 'updates the status of article' do
      patch "/articles/#{@articles.id}",
      {
        article:{
          favorite: true
        }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
      expect(response).to be_success
      expect(response.content_type).to be Mime::JSON

      comment = JSON.parse(response.body)
      expect(comment["favorite"]).to eq true
    end
  end
end
