json.extract! store, :id, :user_id, :name, :description, :address, :phone, :instagram, :facebook, :locaation_long, :location_lat, :is_approved, :created_at, :updated_at
json.url store_url(store, format: :json)
