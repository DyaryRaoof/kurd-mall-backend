class RenameStoreAnlyticsColumnStroeNameToStoreName < ActiveRecord::Migration[7.0]
  def change
    rename_column :store_analytics, :stroe_name, :store_name
  end
end
