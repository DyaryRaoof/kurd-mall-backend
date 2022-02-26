class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :order_no
      t.bigint :driver_id
      t.string :item_name
      t.string :supplier_name
      t.float :price
      t.string :currency
      t.integer :shipping_kg
      t.integer :quantity
      t.integer :total_weight
      t.float :total_price
      t.boolean :is_picked_up
      t.boolean :is_delivered

      t.timestamps
    end
  end
end
