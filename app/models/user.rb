class User < ApplicationRecord
  rolify
  after_create :set_up_role
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise(
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable
  )
  has_one :cart, dependent: :destroy
  has_many :orders, through: :cart
  has_many :items

  def current_cart
    create_cart(user_id: id) if cart.nil?
    cart
  end

  private

  def set_up_role
    add_role(:customer) if roles.blank?
  end
end
