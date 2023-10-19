class CreateSingers < ActiveRecord::Migration[7.0]
  def change
    create_table :singers do |t|
      t.string :name
      t.boolean :genre
      t.text :description
      t.boolean :author
      t.timestamps
    end
  end
end
