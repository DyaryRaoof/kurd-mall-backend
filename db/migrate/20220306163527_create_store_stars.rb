class CreateStoreStars < ActiveRecord::Migration[7.0]
  def change
    create_table :store_stars do |t|
      t.references :store, null: false, foreign_key: true
      t.integer :number
      t.integer :reviewers

      t.timestamps
    end
  end
end
