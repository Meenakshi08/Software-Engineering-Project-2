json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :user_id
end
