class OrderMailer < ApplicationMailer
  default from: 'from@example.com'

  def order_email
    @user = params[:user]
    @order = params[:order]
    mail(to: @user.email, subject: 'Thank you fot your order!')
  end
end
