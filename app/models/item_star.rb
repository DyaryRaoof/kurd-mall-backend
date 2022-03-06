class ItemStar < ApplicationRecord
  belongs_to :item

  validates :item, presence: true
  validates :item, uniqueness: true
end
