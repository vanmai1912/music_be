class Api::TypeWithSongsSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :popularity, :albumCover

  has_many :songs, serializer: Api::SongSerializer

  def albumCover
    object.image.url if object.image.attached?
  end

end
