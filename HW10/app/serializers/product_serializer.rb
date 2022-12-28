class ProductSerializer < ActiveModel::Serializer
  attributes :name, :image, :price
end
