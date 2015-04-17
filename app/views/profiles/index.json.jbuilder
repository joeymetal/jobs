json.array!(@profiles) do |profile|
  json.extract! profile, :id, :skills, :objectives, :formations, :professional_experiences, :qualifications, :additional_informations
  json.url profile_url(profile, format: :json)
end
