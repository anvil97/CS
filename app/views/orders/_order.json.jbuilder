json.extract! order, :id, :total, :tax, :subtotal, :order_status_id, :customer_id, :created_at, :updated_at
json.url order_url(order, format: :json)
