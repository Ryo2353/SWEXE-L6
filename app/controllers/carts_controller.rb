class CartsController < ApplicationController
  def show
    @cart_item = CartItem.where(cart_id: current_cart.id)
  end
end
