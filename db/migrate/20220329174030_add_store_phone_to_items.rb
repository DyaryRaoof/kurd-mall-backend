class AddStorePhoneToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :store_name, :string
    add_column :items, :store_phone, :bigint
  end
end
