class CreateApplicantJobs < ActiveRecord::Migration
  def change
    create_table :applicant_jobs do |t|
      t.integer :applicant_id
      t.integer :job_id

      t.timestamps
    end
    add_index :applicant_jobs, :applicant_id
    add_index :applicant_jobs, :job_id
  end
end
#, unique: true