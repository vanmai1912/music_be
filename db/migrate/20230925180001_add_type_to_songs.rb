class AddTypeToSongs < ActiveRecord::Migration[7.0]
  def change
    add_reference :songs, :type, null: true, foreign_key: true
  end
end
