class AddFoundationToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :foundation, :date, default: 'now()'
  end
end
