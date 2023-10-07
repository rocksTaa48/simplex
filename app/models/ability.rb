# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Item, published: true

    return unless user.present?

    can(%i[read update], Item, user:)

    return unless user.admin?

    can %i[read update], Item
  end
end
