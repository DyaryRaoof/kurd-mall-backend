class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :image, :string
    add_column :users, :phone, :integer
    add_column :users, :is_driver, :boolean
    add_column :users, :is_admin, :boolean
  end
end
