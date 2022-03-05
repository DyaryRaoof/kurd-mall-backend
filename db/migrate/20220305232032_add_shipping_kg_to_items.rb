class AddShippingKgToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :shipping_kg, :integer
  end
end
