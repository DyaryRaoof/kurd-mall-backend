class AddCityRefToStore < ActiveRecord::Migration[7.0]
  def change
    add_reference :stores, :city, null: false, foreign_key: true
    add_reference :stores, :category, null: false, foreign_key: true
    add_reference :stores, :subcategory, null: false, foreign_key: true
  end
end
