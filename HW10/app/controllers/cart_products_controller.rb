class CartProductsController < ApplicationController

  def create
    if params[:product]
      product = Product.find(params[:product])
      cart_prod = Cart.find(cookies[:cart_id]).cart_products.where(product_id: params[:product])
      if cart_prod.empty?
        CartProduct.create(cart_id: cookies[:cart_id], product_id: product.id, name: product.name, image: product.image,
                           price: product.price, quantity: 1)
      else
        cart_prod.update(quantity: CartProduct.find(cart_prod.ids).first.quantity + 1)
      end
    end
    redirect_back_or_to "/"
  end

  def update
    if params[:plus]
      cart_prod = CartProduct.find(params[:plus])
      cart_prod.update(quantity: cart_prod.quantity + 1)
    else
      cart_prod = CartProduct.find(params[:minus])
      if cart_prod.quantity > 1
        cart_prod.update(quantity: cart_prod.quantity - 1)
      else cart_prod.destroy end
    end
    redirect_to carts_path
  end

  def destroy
    CartProduct.find(params[:id]).destroy
    redirect_to carts_path
  end
end
