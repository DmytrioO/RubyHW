# == Schema Information
#
# Table name: orders
#
#  id             :bigint           not null, primary key
#  cart_id        :bigint
#  user_id        :bigint
#  order_status   :integer
#  payment_status :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user, optional: true
  has_one :order_information, dependent: :destroy

  enum :order_status, %i[processing confirmed delivering completed canceled]
  enum :payment_status, %i[unpaid paid post]
end
