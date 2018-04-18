json.extract! raw_inventory, :id, :quantity, :expired_at, :created_at, :updated_at
json.url raw_inventory_url(raw_inventory, format: :json)
