class Type < ApplicationRecord
  has_many :songs, dependent: :nullify
  has_one_attached :image 

  before_destroy :nullify_songs

  private

  def nullify_songs
    songs.update_all(type_id: nil)
  end 
end
