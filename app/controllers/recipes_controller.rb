class RecipesController < ApplicationController

  # def first_recipe_method
  #   recipe = Recipe.first # an instance/hash
  #   render json: recipe.as_json
  # end

  def index
    recipes = Recipe.all
    render json: recipes.as_json
  end

  def show
    recipe = Recipe.find(params[:id])
    render json: recipe.as_json
  end

end
