class StoreSerializer
  include JSONAPI::Serializer
  has_many :items, serializer: ItemSerializer
  attributes :user_id, :name, :description, :address, :phone, :instagram, :facebook, :locaation_long, :location_lat, :is_approved, :city_id, :category_id, :subcategory_id, :image_urls, :id
end
