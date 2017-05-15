json.extract! stock, :id, :product_id, :quantity, :expiration_date, :created_at, :updated_at
json.url stock_url(stock, format: :json)
