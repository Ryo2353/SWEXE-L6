class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(name: params[:product][:name], price: params[:product][:price])
    if @product.save
      flash[:notice] = '１レコード追加しました'
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path
  end
end
