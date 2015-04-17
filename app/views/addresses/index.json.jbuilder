json.array!(@addresses) do |address|
  json.extract! address, :id, :street, :neighborhood, :city, :state, :cep, :number
  json.url address_url(address, format: :json)
end
