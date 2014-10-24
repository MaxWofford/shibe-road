json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :public_address
  json.url product_url(product, format: :json)
end
