class AddCheckedToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :checked, :boolean, default: false
  end
end
