json.array!(@customers) do |customer|
  json.extract! customer, :id, :trading_name, :fancy_name, :cnpj, :commercial_activity
  json.url customer_url(customer, format: :json)
end
