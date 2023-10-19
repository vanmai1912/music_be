class Api::SingerSerializer < ActiveModel::Serializer
  attributes :id, :name, :genre, :image, :description, :created_at, :updated_at

  def image
    object.avatar.url if object.avatar.attached?
  end
end
