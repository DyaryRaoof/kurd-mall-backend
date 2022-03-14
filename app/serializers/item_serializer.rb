class ItemSerializer
  include JSONAPI::Serializer
  # has_many :item_variants, serializer: ItemVariantSerializer
  # has_many :tags, serializer: TagSerializer
  has_many :item_variants, serializer: ItemVariantSerializer
  has_many :tags, serializer: TagSerializer
  belongs_to :user, serializer: UserSerializer
  belongs_to :store, serializer: StoreSerializer
  attributes :id, :user_id, :store_id, :name, :description,
  :price, :cost, :quantity, :shipping_kg, :currency,
  :is_approved, :city_id, :category_id, :subcategory_id, :item_variants,:tags, :image_urls, :stars

end
