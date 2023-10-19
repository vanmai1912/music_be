class AddFieldsToUSers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :role, :integer
    add_column :users, :active, :boolean
    add_column :users, :phone, :string
    # Tùy chọn timestamps tạo ra các cột 'created_at' và 'updated_at' tự động
    # Nếu bạn đã có chúng trong bảng 'users', bạn có thể bỏ dòng này
  end
end
