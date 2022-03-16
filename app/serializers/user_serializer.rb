class UserSerializer
  include JSONAPI::Serializer
  has_one :store, serializer: StoreSerializer
  attributes :id, :name, :email, :phone, :is_driver, :is_admin, :image, :store_id, :city_id, :image_urls
end
