class OrderMailer < ApplicationMailer
  default from: 'from@example.com'

  def order_email(order)
    @order = order

    @order.cart.cart_products.each do |cart_product|
      attachments["#{cart_product.name}.jpg"] = cart_product.product.image.download
    end

    mail(to: order.user.email, subject: 'Thank you for your order!')
  end
end
