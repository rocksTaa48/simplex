class OrdersController < ApplicationController
  def create
    current_order.add_item(
      item_id: params[:item_id],
      quantity: params[:quantity]
    )
  end

  def destroy
    current_order.remove_item(id: params[:id])
  end

  def checked
    @selected_orders = Order.where(id: params[:order_ids]).destroy_all
    respond_to do |format|
      format.turbo_stream do
        render(
          turbo_stream: turbo_stream.replace(
            'cart',
            partial: 'cart/cart',
            locals: { cart: @cart }
          )
        )
      end
    end
  end
end
