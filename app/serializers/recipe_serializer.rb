class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :ingredients, :directions, :prep_time, :image_url, :ingredients_list, :directions_list, :friendly_created_at, :friendly_prep_time, :user_id, :created_at
  
  attribute :owner, if: :current_user

  def owner
    current_user.id == object.user_id
  end
end
