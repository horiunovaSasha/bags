json.extract! product, :id, :title, :description, :price, :availability, :vendor_code, :external_id, :created_at, :updated_at
json.url product_url(product, format: :json)
