class RecipesController < ApplicationController

  def first_recipe_method
    recipe = Recipe.first # an instance/hash
    render json: recipe.as_json
  end

end
