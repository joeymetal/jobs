class AddFoundationToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :foundation, :date, default: 'CURRENT_DATE'
  end
end
