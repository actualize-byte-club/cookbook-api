class RemoveChefFromRecipes < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :chef, :string
  end
end
