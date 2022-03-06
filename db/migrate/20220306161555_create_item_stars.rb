class CreateItemStars < ActiveRecord::Migration[7.0]
  def change
    create_table :item_stars do |t|
      t.references :item, null: false, foreign_key: true
      t.integer :number
      t.integer :reviewers

      t.timestamps
    end
  end
end
