# == Schema Information
#
# Table name: order_informations
#
#  id         :bigint           not null, primary key
#  order_id   :bigint           not null
#  first_name :string
#  last_name  :string
#  phone      :string
#  city       :string
#  street     :string
#  house      :string
#  apartments :string
#  total      :decimal(8, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class OrderInformation < ApplicationRecord
  belongs_to :order

  validates :phone, presence: true, format: { with: /\A\+380\d{9}\z/ }
end
