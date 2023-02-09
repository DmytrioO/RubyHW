class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token

  helper_method :cart_check
  helper_method :find_total_products

  def cart_check
    @cart = Cart.find(cookies[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    cookies[:cart_id] = @cart.id
    @cart
  end

  def find_total_products(cart_id)
    sum = 0
    Cart.find(cart_id).cart_products.each do |cart_product|
      sum += cart_product.quantity
    end
    sum
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
