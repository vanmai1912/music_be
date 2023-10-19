class Api::SongSerializer < ActiveModel::Serializer
  attributes :id, :name, :duration, :path, :lyrics, :source, :created_at, :updated_at, :singer

  def singer
    Api::SingerSerializer.new(object.singer).as_json
  end

  def name
    object.title
  end
  

  def path
    object.audio.url if object.audio.attached?
  end
end
