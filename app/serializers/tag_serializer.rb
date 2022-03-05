class TagSerializer
  include JSONAPI::Serializer
  belongs_to :item, serializer: ItemSerializer
  attributes :id, :name, :item_id
end
