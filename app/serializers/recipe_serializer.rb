class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :chef, :ingredients, :directions, :prep_time, :image_url, :ingredients_list, :directions_list, :friendly_created_at, :friendly_prep_time
end
