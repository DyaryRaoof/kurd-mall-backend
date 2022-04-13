class StoreStar < ApplicationRecord
  belongs_to :store
  validates :store, presence: true
  validates :store, uniqueness: true
end
