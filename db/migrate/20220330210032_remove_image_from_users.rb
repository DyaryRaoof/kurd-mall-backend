class RemoveImageFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :image
  end
end
