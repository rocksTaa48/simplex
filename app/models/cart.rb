class Cart < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_many :items, through: :orders
end
