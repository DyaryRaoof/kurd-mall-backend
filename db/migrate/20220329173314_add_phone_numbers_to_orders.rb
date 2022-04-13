class AddPhoneNumbersToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :user_phone, :bigint
    add_column :orders, :store_phone, :bigint
    add_column :orders, :driver_phone, :bigint
  end
end
