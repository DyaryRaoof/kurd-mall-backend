class AddLocationToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :location_lat, :float
    add_column :orders, :location_long, :float
  end
end
