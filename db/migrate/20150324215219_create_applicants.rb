class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :first_name
      t.string :last_name
      t.integer :cpf
      t.string :rg
      t.string :sex

      t.timestamps
    end
  end
end
