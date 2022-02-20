class Item < ApplicationRecord
  belongs_to :user
  belongs_to :store
  has_many_attached :images, dependent: :destroy
  has_many :item_variants, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates_numericality_of :price
  validates :currency, presence: true, :inclusion => { in: ['IQD', 'USD'] }
  after_initialize :set_defaults, if: :new_record?
  
  def set_defaults
    self.is_approved ||= false
  end

end
