json.array!(@applicant_jobs) do |applicant_job|
  json.extract! applicant_job, :id, :applicant_id, :job_id
  json.url applicant_job_url(applicant_job, format: :json)
end
