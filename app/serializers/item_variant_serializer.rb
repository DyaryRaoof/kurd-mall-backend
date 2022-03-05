class ItemVariantSerializer
  include JSONAPI::Serializer
  belongs_to :item, serializer: ItemSerializer
  attributes :id, :item_id, :store_id, :name, :value, :price, :cost, :currency, :image_index
end
