class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token

  helper_method :cart_check

  def cart_check
    @cart = Cart.find(cookies[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    cookies[:cart_id] = @cart.id
    @cart
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
