class ItemStar < ApplicationRecord
  belongs_to :item
  validates :item, presence: true
  validates :user_id, presence: true
  validates :number, presence: true, inclusion: { in: [0, 1, 2, 3, 4, 5] }
  validate :already_exists, on: :create

  def already_exists
    item_star = ItemStar.where(item_id: self.item_id, user_id: self.user_id)[0]
    unless item_star.nil?
      errors.add(:item_id, "You have already rated this item.")
    end
  end

end
