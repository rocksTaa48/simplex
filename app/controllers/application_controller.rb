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

  # Render 404_Error
  def render_error
    respond_to do |format|
      format.html { render(file: "#{Rails.root}/public/404.html", status: :not_found) }
      format.xml { head(:not_found) }
      format.any { head(:not_found) }
    end
  end

  # AccessDenied_Error_CanCan_gem
  rescue_from(CanCan::AccessDenied) do |exception|
    @error_message = exception.message
    respond_to do |format|
      format.html { render(file: "#{Rails.root}/public/401.html", status: 401) }
    end
  end
end
