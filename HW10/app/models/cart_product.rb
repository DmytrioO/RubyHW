# == Schema Information
#
# Table name: cart_products
#
#  id         :bigint           not null, primary key
#  cart_id    :bigint           not null
#  product_id :bigint           not null
#  name       :string
#  image      :string
#  string     :string
#  price      :decimal(8, 2)
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product
end
