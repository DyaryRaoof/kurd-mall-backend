class Subcategory < ApplicationRecord
  belongs_to :category
  
  validates :name_en, presence: true
  validates :name_en, uniqueness: true
  validates :name_ku, presence: true
  validates :name_ku, uniqueness: true
  has_many :stores
  has_many :items
end
