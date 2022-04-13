class AddUserRefToItemStars < ActiveRecord::Migration[7.0]
  def change
    add_reference :item_stars, :user, null: false, foreign_key: true
  end
end
