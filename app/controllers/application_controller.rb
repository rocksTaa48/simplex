class ApplicationController < ActionController::Base
  before_action :render_cart

  def render_cart
    @render_cart = true
  end

  def current_cart
    if current_user.present?
      current_user.current_cart
    else
      Cart.find(session[:cart_id])
    end
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart_id
  end
end
