require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  before do
    user = User.create(name: "Dani", email: "dani@gmail.com", password: "password")
    Recipe.create(title: "Raw Eggs", ingredients: "One live chicken", user_id: user.id)
    Recipe.create(title: "Empty Sandwich", user_id: user.id)
    Recipe.create(title: "Licorice", user_id: user.id)
  end
  describe "GET /recipes" do
    it "returns an array of recipe data" do
      get "/recipes"
      recipes = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(recipes.length).to eq(3)
    end
  end
  describe "GET /recipes/:id" do
    it "return a hash of recipe data with the correct attributes" do
      get "/recipes/#{Recipe.first.id}"
      recipe = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(recipe["title"]).to eq("Raw Eggs")
      puts recipe
      expect(recipe["ingredients"]).to eq("One live chicken")
    end
  end
  describe "POST /recipes" do
    it "should create a recipe when given valid data and Authorization header" do
      jwt = JWT.encode(
        {user_id: User.first.id},
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )
      post "/recipes", params: {title: "New Title", ingredients: "New Ingredients",
      directions: "New Directions"}, headers: {"Authorization" => "Bearer #{jwt}"}
      recipe = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      expect(recipe["title"]).to eq("New Title")
    end
    it "should return unauthorized when not given Authorization header" do
      post "/recipes", params: {title: "New Title"}
      recipe = JSON.parse(response.body)
      expect(response).to have_http_status(:unauthorized)
    end
    it "should return unprocessable entity when given invalid data" do
      jwt = JWT.encode(
        {user_id: User.first.id},
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )
      post "/recipes", params: {}, headers: {"Authorization" => "Bearer #{jwt}"}
      recipe = JSON.parse(response.body)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end