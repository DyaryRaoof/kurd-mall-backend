class ItemVariant < ApplicationRecord

  validates :item_id, presence: true
  validates :store_id, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates_numericality_of :price
  validates :currency, presence: true, :inclusion => { in: ['IQD', 'USD'] }
  validates :image_index, presence: true, :inclusion => { in: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13 ,14] }
  validate :image_index_presence

  belongs_to :item
  belongs_to :store

  def image_index_presence 
    puts self.item.images.length
    puts self.item.images[self.image_index]
    puts self.item.images[self.image_index]
    puts self.item.images[self.image_index]
    if self.item.images[self.image_index] == nil
      errors.add(:image_index, "should be for an image in the parent item that exists within this range below #{self.item.images.length - 1}")
    end
  end
  
end
