json.array!(@jobs) do |job|
  json.extract! job, :id, :title, :vacancies, :salary, :expiration, :description
  json.url job_url(job, format: :json)
end
