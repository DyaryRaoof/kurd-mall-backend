class AddUserImageToStoreComments < ActiveRecord::Migration[7.0]
  def change
    add_column :store_comments, :user_image, :string
  end
end
