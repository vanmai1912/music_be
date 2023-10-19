class AddSingerReferenceToSongs < ActiveRecord::Migration[7.0]
  def change
    add_reference :songs, :singer, null: true, foreign_key: true
  end
end
