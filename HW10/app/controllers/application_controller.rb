class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token

  helper_method :cart_check
  helper_method :find_cart_total

  def cart_check
    if cookies[:cart_id].nil?
      @cart = Cart.create
      cookies[:cart_id] = @cart.id
    else
      @cart = Cart.find(cookies[:cart_id])
    end
  end

  def find_cart_total(cart_id)
    cart_prod = Cart.find(cart_id).cart_products
    total = 0
    cart_prod.each do |prod|
      total += prod.price * prod.quantity
    end
    total
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
