class AddStoreIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :store_id, :integer
    add_column :users, :city_id, :integer
  end
end
