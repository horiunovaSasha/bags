json.extract! product, :id, :id, :title, :description, :price, :availability, :vendor_code, :created_at, :updated_at
json.url product_url(product, format: :json)
