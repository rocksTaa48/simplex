class Item < ApplicationRecord
  belongs_to :subcategory
  has_many :orders
  has_many :carts, through: :orders
  belongs_to :user
end
