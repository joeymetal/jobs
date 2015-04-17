class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :tel
      t.string :cel
      t.string :others
      t.text :observations

      t.timestamps
    end
  end
end
