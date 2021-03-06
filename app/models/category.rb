class Category < ApplicationRecord
  validates :name_en, presence: true
  validates :name_en, uniqueness: true
  validates :name_ku, presence: true
  validates :name_ku, uniqueness: true
  has_many :stores
  has_many :items
  has_many :subcategories
end
