class AddBirthdayToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :birthday, :date, default: 'now()'
  end
end
