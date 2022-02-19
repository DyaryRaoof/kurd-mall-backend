class Item < ApplicationRecord
  belongs_to :user
  belongs_to :store
  has_many_attached :images, dependent: :destroy
end
