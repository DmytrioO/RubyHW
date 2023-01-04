class CartsController < ApplicationController
  def index
    if cookies[:cart_id].nil?
      create_cart
      cookies[:cart_id] = @cart.id
    else
      @cart = Cart.find(cookies[:cart_id])
    end
  end

  private

  def create_cart
    @cart = Cart.create()
  end
end