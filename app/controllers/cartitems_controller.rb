class CartitemsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @cart_item = CartItem.new
  end
  
  def create
    @cart_item = CartItem.new(qty: params[:cart_item][:qty], product_id: params[:product_id], cart_id: current_cart.id)
    if @cart_item.save
      flash[:notice] = '１レコード追加しました'
      redirect_to cart_path(current_cart)
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(current_cart)
  end
end
