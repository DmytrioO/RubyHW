class OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[ index show create ]

  def index
    @orders = current_user.orders if user_signed_in?
  end

  def show
    begin
    @order = current_user.orders.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @order = 'Not Found'
    end
  end

  def create
    @order = Order.create(cart_id: cookies[:cart_id], user_id: current_user.id, payment_status: params[:pay])
    @order_info = OrderInformation.create(order_id: @order.id, total: cookies[:total])
    @order_info.update(order_params)
    # OrderMailer.with(user: User.find(@order.user_id), order: @order).order_email.deliver_now
    cookies.delete :cart_id
    cookies.delete :total
  end

  def update
    @order = Order.find(params[:id])
    @order.paid!
    redirect_to @order
  end

  private

  def order_params
    params.permit(:first_name, :last_name, :phone, :city, :street, :house, :apartments)
  end
end
