class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :skills
      t.text :objectives
      t.text :formations
      t.text :professional_experiences
      t.text :qualifications
      t.text :additional_informations

      t.timestamps
    end
  end
end
