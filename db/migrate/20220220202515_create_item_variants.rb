class CreateItemVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :item_variants do |t|
      t.references :item, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.string :name
      t.string :value
      t.float :price
      t.float :cost
      t.string :currency
      t.integer :image_index

      t.timestamps
    end
  end
end
