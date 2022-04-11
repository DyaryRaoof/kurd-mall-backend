class User < ApplicationRecord
  attr_accessor :user_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  has_many_attached :images, dependent: :destroy
  validates :is_admin, presence: false
  validates :is_driver, presence: false

  def image_urls
    images.map { |i| Rails.application.routes.url_helpers.url_for(i) }
  end
end
