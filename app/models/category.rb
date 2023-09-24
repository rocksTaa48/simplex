class Category < ApplicationRecord
  has_many :subcategories
  has_many :items, through: :subcategories
end
