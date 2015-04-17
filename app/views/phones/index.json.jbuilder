json.array!(@phones) do |phone|
  json.extract! phone, :id, :tel, :cel, :others, :observations
  json.url phone_url(phone, format: :json)
end
