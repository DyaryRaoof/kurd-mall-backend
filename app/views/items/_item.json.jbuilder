json.extract! item, :id, :user_id, :store_id, :name, :description, :price, :currency, :is_approved, :created_at,
              :updated_at
json.url user_store_item_url(item, format: :json, id: item.id)
