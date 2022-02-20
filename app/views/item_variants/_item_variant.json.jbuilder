json.extract! item_variant, :id, :item_id, :store_id, :name, :value, :price, :cost, :currency, :image_index, :created_at, :updated_at
json.url item_variant_url(item_variant, format: :json)
