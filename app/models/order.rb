class Order < ApplicationRecord
  include AASM

  belongs_to :cart
  belongs_to :item

  aasm do
    state :default, initial: true
    state :purchased, :sent, :in_point

    event(:payed) do
      transitions from: :default, to: :purchased
    end

    event(:deliver) do
      transitions from: :purchased, to: :setn
    end

    event(:ready) do
      transitions from: %i[purchased sent], to: :in_point
    end
  end

  def subtotal
    item.price * quantity
  end
end
