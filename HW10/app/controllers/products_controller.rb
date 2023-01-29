class ProductsController < ApplicationController
  def index
    if params[:category]
      @products = Category.find_by(title: params[:category]).products.order(price: :desc)
    else
      @products = Product.order(price: :desc)
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
