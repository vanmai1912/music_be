class CreateTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :types do |t|
      t.string :name # Trường để lưu tên thể loại
      t.string :description # Trường để lưu mô tả thể loại
      t.integer :popularity # Trường để lưu độ phổ biến của thể loại
      t.timestamps
    end
  end
end
