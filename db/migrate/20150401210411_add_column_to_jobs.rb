class AddColumnToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :featured, :boolean, :default => false
  end
end
