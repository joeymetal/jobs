class CreateJoinTableApplicantsJobs < ActiveRecord::Migration
  def change
    create_join_table :applicants, :jobs do |t|
      # t.index [:applicant_id, :job_id]
      # t.index [:job_id, :applicant_id]
    end
  end
end
