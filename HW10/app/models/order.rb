class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user

  enum :order_status, %i[processing confirmed delivering completed canceled]
  enum :payment_status, %i[unpaid paid post]
end
