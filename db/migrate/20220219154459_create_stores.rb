class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :address
      t.bigint :phone
      t.string :instagram
      t.string :facebook
      t.float :locaation_long
      t.float :location_lat
      t.boolean :is_approved

      t.timestamps
    end
  end
end
