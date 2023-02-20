class OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[ index show create ]

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    @order = nil
  end

  def create
    @order = Order.create(cart_id: cookies[:cart_id], user: current_user, payment_status: params[:pay])
    @order.build_order_information(order_information_params).save
    OrderMailer.order_email(@order).deliver_later
    cookies.delete(:cart_id)
  end

  def update
    @order = Order.find(params[:id])
    @order.paid!

    redirect_to @order
  end

  private

  def order_information_params
    params.permit(:first_name, :last_name, :phone, :city, :street, :house, :apartments, :total)
  end
end
