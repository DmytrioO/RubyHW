# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  price       :decimal(8, 2)
#  category_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
  belongs_to :category, optional: true

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_fit: [100, nil]
    attachable.variant :full, resize_to_fit: [1000, nil]
  end
  # has_one_attached :image

  def attach_img(link)
    url = URI.parse(link)
    filename = File.basename(url.path)
    file = URI.open(url)
    self.image.attach(io: file, filename: filename)
  end

  after_create_commit -> { broadcast_prepend_to 'products', partial: 'products/products' }
  after_update_commit -> { broadcast_replace_to "products", partial: "products/products" }
  after_destroy_commit -> { broadcast_remove_to 'products' }
end
