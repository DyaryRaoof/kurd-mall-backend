class AddStoreRefToItemAnalytics < ActiveRecord::Migration[7.0]
  def change
    add_reference :item_analytics, :store, null: false, foreign_key: true
  end
end
