class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :ingredients
      t.string :directions
      t.integer :prep_time
      t.string :chef
      t.string :image_url

      t.timestamps
    end
  end
end
