class AddFoundationToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :foundation, :integer
  end
end
