# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

  def find_total
    total = 0
    self.cart_products.each do |cart_product|
      total += cart_product.price * cart_product.quantity
    end
    total
  end
end
