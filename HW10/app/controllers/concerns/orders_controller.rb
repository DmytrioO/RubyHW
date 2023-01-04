class OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[ show create ]

  def index
    if user_signed_in?
      @orders = current_user.orders
    else
      @orders = nil
    end
  end

  def show
    @order = Order.find(params[:id])
    if @order.user_id != current_user.id
      @order = nil
    end
    @order.update(payment_status: 1) if params[:payment]
  end

  def create
    @order = Order.create(cart_id: params[:cart], user_id: current_user.id, order_status: 0, payment_status: params[:pay])
    @order_info = OrderInformation.create(order_id: @order.id, full_name: "#{params[:firstname]} #{params[:lastname]}",
                                          phone: params[:number], city: params[:city],
                                          street: params[:street], house: params[:house],
                                          apartaments: "#{params[:apartaments]}")
    cookies.delete :cart_id
  end
end
