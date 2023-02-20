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

  def attach_img(link)
    url = URI.parse(link)
    filename = File.basename(url.path)
    response = Net::HTTP.get_response(url)
    file = StringIO.new(response.body)
    image.attach(io: file, filename: filename)
  end

  def insert_image
    if image.attached?
      image.variant(:thumb).blob
    else
      'https://i0.wp.com/tacm.com/wp-content/uploads/2018/01/no-image-available.jpeg?resize=768%2C510&ssl=1'
    end
  end

  after_create_commit -> { broadcast_prepend_to 'products', partial: 'products/products' }
  after_update_commit -> { broadcast_replace_to 'products', partial: 'products/products' }
  after_destroy_commit -> { broadcast_remove_to 'products' }
end
