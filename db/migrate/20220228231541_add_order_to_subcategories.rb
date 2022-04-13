class AddOrderToSubcategories < ActiveRecord::Migration[7.0]
  def change
    add_column :subcategories, :order, :integer
  end
end
