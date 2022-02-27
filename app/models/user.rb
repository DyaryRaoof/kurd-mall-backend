class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  has_one_attached :image, dependent: :destroy


  def jwt_payload
    { 'foo' => 'bar' }
  end

end
