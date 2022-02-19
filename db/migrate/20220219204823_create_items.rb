class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.float :price
      t.string :currency
      t.boolean :is_approved

      t.timestamps
    end
  end
end
