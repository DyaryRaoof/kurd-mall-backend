class UserSerializer
  include JSONAPI::Serializer
  has_many :stores, serializer: StoreSerializer
  has_many :items, serializer: ItemSerializer
  attributes :id, :name, :email, :phone, :is_driver, :is_admin, :image, :store_id, :city_id
end
