class AddQuantityToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :quantity, :integer
  end
end
