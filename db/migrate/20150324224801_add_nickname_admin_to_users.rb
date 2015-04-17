class AddNicknameAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :nick_name, :string
    add_index :users, :nick_name, unique: true
  end
end
