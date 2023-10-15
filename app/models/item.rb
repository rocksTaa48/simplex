class Item < ApplicationRecord
  include AASM
  belongs_to :subcategory
  has_many :orders
  has_many :carts, through: :orders
  belongs_to :user

  aasm do
    state :template, initial: true
    state :published, :sold, :cancelled

    event(:done) do
      transitions from: :template, to: :published
    end

    event(:no_more) do
      transitions from: :published, to: :sold
    end

    event(:denay) do
      transitions from: %i[published template], to: :cancelled
    end
  end
end
