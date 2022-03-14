class ItemVariant < ApplicationRecord
  attr_accessor :skip_image_index_presence_validation
  validates :item_id, presence: true
  validates :store_id, presence: true
  validates :name, presence: true
  validates :value, presence: true
  # validates_numericality_of :price
  # validates :currency, presence: true, inclusion: { in: %w[IQD USD] }
  validates :image_index, presence: true, inclusion: { in: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14] }
  validate :image_index_presence, unless: :skip_image_index_presence_validation

  belongs_to :item
  belongs_to :store

  def image_index_presence
    return unless item.images[image_index].nil?
    errors.add(:image_index,
               "should be for an image in the parent item that exists within this range below
                 #{item.images.length}")
  end
end
