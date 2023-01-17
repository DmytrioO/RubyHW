class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :cart_check

  def index; end
end