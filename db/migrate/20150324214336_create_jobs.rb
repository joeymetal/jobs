class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.integer :vacancies
      t.decimal :salary
      t.date :expiration
      t.text :description

      t.timestamps
    end
  end
end
