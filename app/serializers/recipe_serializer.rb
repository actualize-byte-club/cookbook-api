class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :title_downcase, :ingredients, :directions, :prep_time, :image_url, :ingredients_list, :directions_list, :friendly_created_at, :friendly_prep_time, :created_at
  
  attribute :owner, if: :current_user

  belongs_to :user

  def owner
    current_user.id == object.user_id
  end

  def title_downcase
    object.title.downcase
  end
end


