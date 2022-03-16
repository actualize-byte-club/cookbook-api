class MessageSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at, :name
  
  def name
    object.user.name    
  end
end
