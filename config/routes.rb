Rails.application.routes.draw do
  # get "/first_recipe_path", controller: "recipes", action: "first_recipe_method"

  get "/recipes" => "recipes#index"
  get "/recipes/:id" => "recipes#show"
end

