class CartProductsController < ApplicationController
  before_action :set_product, only: %i[ update destroy ]

  def create
    if params[:product]
      product = Product.find(params[:product])
      cart_prod = Cart.find(cookies[:cart_id]).cart_products.where(product_id: params[:product])
      if cart_prod.empty?
        CartProduct.create(cart_id: cookies[:cart_id], product_id: product.id, name: product.name,
                           price: product.price, quantity: 1)
      else
        cart_prod.update(quantity: CartProduct.find(cart_prod.ids).first.quantity + 1)
      end
    end
    redirect_back_or_to root_path
  end

  def update
    product_quantity = params[:operation] == 'plus' ? @product.quantity + 1 : @product.quantity - 1
    product_quantity > 0 ? @product.update(quantity: product_quantity) : @product.destroy
    redirect_to carts_path
  end

  def destroy
    @product.destroy
    redirect_to carts_path
  end

  private

  def set_product
    @product = CartProduct.find(params[:id])
  end
end
