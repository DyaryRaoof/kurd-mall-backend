class CreateOrderVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :order_variants do |t|
      t.bigint :order_id
      t.references :item_variant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
