class AddBirthdayToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :birthday, :integer
  end
end
