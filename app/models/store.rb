class Store < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  has_one :store_stars, dependent: :destroy
  
  def image_urls
    images.map{|i| Rails.application.routes.url_helpers.url_for(i) }
  end
end
