json.extract! dishes_product, :id, :plate_id, :product_id, :created_at, :updated_at
json.url dishes_product_url(dishes_product, format: :json)
