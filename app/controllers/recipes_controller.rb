class RecipesController < ApplicationController

  def index
    recipes = Recipe.all
    render json: recipes
  end

  def create
    recipe = Recipe.new(
      title: params[:title],
      chef: params[:chef],
      ingredients: params[:ingredients],
      directions: params[:directions],
      prep_time: params[:prep_time]
    )
    recipe.save
    render json: recipe
  end

  def show
    recipe = Recipe.find(params[:id])
    render json: recipe
  end

  def update
    # Find the right recipe using the url segment parameter
    recipe = Recipe.find(params[:id])
    # Update the recipe with the body parameters
    recipe.title = params[:title] || recipe.title
    recipe.chef = params[:chef] || recipe.chef
    recipe.ingredients = params[:ingredients] || recipe.ingredients
    recipe.directions = params[:directions] || recipe.directions
    recipe.prep_time = params[:prep_time] || recipe.prep_time
    recipe.image_url = params[:image_url] || recipe.image_url
    # Save the recipe changes to the database
    recipe.save
    render json: recipe
  end

  def destroy
    # Find the right recipe using the url segment parameter
    recipe = Recipe.find(params[:id])
    # Delete the recipe
    recipe.destroy
    render json: {message: "Recipe successfully destroyed!"}
  end

end
