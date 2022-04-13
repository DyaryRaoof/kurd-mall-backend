class AddOrderedToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :ordered, :boolean
  end
end
