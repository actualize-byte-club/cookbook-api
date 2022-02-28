require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  describe "GET /recipes" do
    it "returns an array of recipe data" do
      user = User.create(name: "Dani", email: "dani@gmail.com", password: "password")
      Recipe.create(title: "Raw Eggs", user_id: user.id)
      Recipe.create(title: "Empty Sandwich", user_id: user.id)
      Recipe.create(title: "Licorice", user_id: user.id)
      get "/recipes"
      recipes = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(recipes.length).to eq(3)
    end
  end
end
