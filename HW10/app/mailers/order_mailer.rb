class OrderMailer < ApplicationMailer
  default from: 'from@example.com'

  def order_email(order_id)
    @order = Order.find(order_id)
    @user = @order.user
    mail(to: @user.email, subject: 'Thank you fot your order!')
  end
end
