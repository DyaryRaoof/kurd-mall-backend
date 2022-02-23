class RemoveCityFieldFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :city, :integer
    remove_column :users, :store, :integer
  end
end
