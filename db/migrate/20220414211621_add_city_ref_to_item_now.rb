class AddCityRefToItemNow < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :city, null: false, foreign_key: true
  end
end
