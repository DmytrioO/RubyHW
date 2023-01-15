# == Schema Information
#
# Table name: order_informations
#
#  id          :bigint           not null, primary key
#  order_id    :bigint           not null
#  full_name   :string
#  phone       :string
#  city        :string
#  street      :string
#  house       :string
#  apartaments :string
#  total       :decimal(8, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class OrderInformation < ApplicationRecord
  belongs_to :order
end
