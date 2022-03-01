class AddOrderToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :order, :integer
  end
end
