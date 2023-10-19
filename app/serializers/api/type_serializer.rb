class Api::TypeSerializer < ActiveModel::Serializer
  
  attributes :id, :name, :description, :popularity, :image


  def image
    object.image.url if object.image.attached?
  end
end
