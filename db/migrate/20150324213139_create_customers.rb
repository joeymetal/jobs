class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :trading_name
      t.string :fancy_name
      t.integer :cnpj
      t.string :commercial_activity

      t.timestamps
    end
  end
end
