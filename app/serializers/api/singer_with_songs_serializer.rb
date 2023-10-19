class Api::SingerWithSongsSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :albumCover

  has_many :songs, serializer: Api::SongSerializer

  def albumCover
    object.avatar.url if object.avatar.attached?
  end
end
