class CartProductsController < ApplicationController

  def index
    create
    redirect_back_or_to "/"
  end

  def create
    if params[:product]
      product = Product.find(params[:product])
      cart_id = cookies[:cart_id]
      cart_prod_ids = Cart.find(cart_id).cart_products.ids
      product_presence = 0
      cart_prod_ids.each do |element_id|
        cart_prod = CartProduct.find(element_id)
        if product.id == cart_prod.product_id
          cart_prod.update(quantity: cart_prod.quantity + 1)
          product_presence = 1
          break
        end
      end
      if product_presence == 0
        CartProduct.create(cart_id: cookies[:cart_id], product_id: product.id, name: product.name, image: product.image,
                           price: product.price, quantity: 1)
      end
    end
    if params[:remove_product]
      destroy
    end
    if params[:plus] || params[:minus]
      update
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
      end
    end
    # redirect_back_or_to "/carts"
  end

  def destroy
    CartProduct.find(params[:remove_product]).destroy
    # redirect_back_or_to "/carts"
  end

  private

  def create_cart
    @cart = Cart.create()
  end

  def cart_check
    if cookies[:cart_id].nil?
      create_cart
      cookies[:cart_id] = @cart.id
    else
      @cart = Cart.find(cookies[:cart_id])
    end
  end
end
