class ChangeColumnBirthday < ActiveRecord::Migration
  def change
  	change_column :applicants, :birthday, :date
  end
end
