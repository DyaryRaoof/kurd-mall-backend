class AddUserImageToItemComments < ActiveRecord::Migration[7.0]
  def change
    add_column :item_comments, :user_image, :string
  end
end
