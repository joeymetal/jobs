json.array!(@applicants) do |applicant|
  json.extract! applicant, :id, :first_name, :last_name, :cpf, :rg, :sex
  json.url applicant_url(applicant, format: :json)
end
