require 'active_record'

class Item < ApplicationRecord
  attr_accessor :stars, :item_comments

  belongs_to :user
  belongs_to :store
  has_many_attached :images, dependent: :destroy
  has_many :item_variants, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :item_stars, dependent: :destroy
  has_many :latest_5_comments, -> { order(created_at: :desc).limit(5) }, class_name: ItemComment.name

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
    images.map { |i| Rails.application.routes.url_helpers.url_for(i) }
  end
end
