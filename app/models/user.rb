class User < ApplicationRecord
  include AASM
  # Include default devise modules. Others available are:
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

  aasm do
    state :buyer, initial: true
    state :seller, :store, :admin

    event(:up_to_seller) do
      transitions from: :buyer, to: :seller
    end

    event(:up_to_store) do
      transitions from: %i[buyer seller], to: :store
    end

    event(:sleep) do
      transitions from: :buyer, to: :admin
    end
  end
end
