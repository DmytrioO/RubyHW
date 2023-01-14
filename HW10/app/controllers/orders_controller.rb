class OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[ show create ]
  before_action :set_order, only: %i[ show update ]

  def index
    @orders = current_user.orders if user_signed_in?
  end

  def show; end

  def create
    @order = Order.create(cart_id: cookies[:cart_id], user_id: current_user.id, order_status: 0,
                          payment_status: params[:pay])
    @order_info = OrderInformation.create(order_id: @order.id, full_name: "#{params[:firstname]} #{params[:lastname]}",
                                          phone: params[:number], city: params[:city], street: params[:street],
                                          house: params[:house], apartaments: "#{params[:apartments]}",
                                          total: cookies[:total])
    cookies.delete :cart_id
    cookies.delete :total
  end

  def update
    @order.paid!
    redirect_to @order
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
