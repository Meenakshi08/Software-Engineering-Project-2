json.array!(@bookings) do |booking|
  json.extract! booking, :id, :source, :destination, :pickup_date, :pickup_time, :user_id, :customer_id
end
