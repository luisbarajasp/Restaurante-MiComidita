json.extract! receipt, :id, :name, :cost, :quantity, :expired_at, :measure, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
