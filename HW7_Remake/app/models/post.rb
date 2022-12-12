class Post < ApplicationRecord
  belongs_to :author
  has_many :comments
  has_many :likes, as: :likeable
  has_many :post_tagsT
  has_many :tags, through: :post_tags

  validates :title, :body, presence: true

  #scope :last_ten, -> { comments.last(10) }
end
