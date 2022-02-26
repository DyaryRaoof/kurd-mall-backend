class CreateItemAnalytics < ActiveRecord::Migration[7.0]
  def change
    create_table :item_analytics do |t|
      t.references :item, null: false, foreign_key: true
      t.string :item_name
      t.bigint :lifetime_views
      t.integer :total_stars
      t.bigint :total_reviews
      t.bigint :total_shares
      t.bigint :total_comments
      t.bigint :total_revenue_usd
      t.bigint :total_revenue_iqd
      t.bigint :total_item_sales

      t.timestamps
    end
  end
end
