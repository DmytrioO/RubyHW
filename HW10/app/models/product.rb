# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  image       :string
#  price       :decimal(8, 2)
#  category_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  belongs_to :category, optional: true
end
