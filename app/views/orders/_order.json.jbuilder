json.extract! order, :id, :user_id, :store_id, :item_id, :order_no, :driver_id, :item_name, :supplier_name, :price, :currency, :shipping_kg, :quantity, :total_weight, :total_price, :is_picked_up, :is_delivered, :created_at, :updated_at
json.url order_url(order, format: :json)
