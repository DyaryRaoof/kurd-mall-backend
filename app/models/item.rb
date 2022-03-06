class Item < ApplicationRecord 
  belongs_to :user
  belongs_to :store
  has_many_attached :images, dependent: :destroy
  has_many :item_variants, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_one :item_star, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates_numericality_of :price
  validates :currency, presence: true, inclusion: { in: %w[IQD USD] }
  after_initialize :set_defaults, if: :new_record?

  def set_defaults
    self.is_approved ||= false
  end

  def image_urls
    images.map{|i| Rails.application.routes.url_helpers.url_for(i) }
  end
end
