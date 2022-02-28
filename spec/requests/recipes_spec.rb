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
      expect(recipe["ingredients"]).to eq("One live chicken")
    end
  end
end