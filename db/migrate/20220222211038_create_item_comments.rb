class CreateItemComments < ActiveRecord::Migration[7.0]
  def change
    create_table :item_comments do |t|
      t.references :item, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :user_name
      t.string :description

      t.timestamps
    end
  end
end
