class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :cep
      t.integer :number

      t.timestamps
    end
  end
end
