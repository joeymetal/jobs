class AddBirthdayToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :birthday, :date, default: 'CURRENT_DATE'
  end
end
