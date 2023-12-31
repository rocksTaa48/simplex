class CartController < ApplicationController
  def show
    @item = Item.find_by(id: params[:id])
    @orders = Order.find_by(id: params[:id])
    @render_cart = false
  end

  def add
    @item = Item.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    @cart = current_cart
    current_order = @cart.orders.find_by(item_id: @item.id)
    if current_order && quantity > 0
      current_order.update(quantity:)
    elsif quantity <= 0
      current_order.destroy
    else
      @cart.orders.create(item: @item, quantity:)
    end
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace('cart',
                                                   partial: 'cart/cart',
                                                   locals: { cart: @cart }),
                              turbo_stream.replace(@item)]
      end
    end
  end

  def remove
    Order.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                  partial: 'cart/cart',
                                                  locals: { cart: @cart })
      end
    end
  end
end
