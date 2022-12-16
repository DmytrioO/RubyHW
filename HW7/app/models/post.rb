class Post < ApplicationRecord
  belongs_to :author
  has_many :comments
  has_many :likes, as: :likeable
  has_many :post_tags
  has_many :tags, through: :post_tags

  validates :title, :body, presence: true

  enum :status, %i[unpublished published]

  scope :filter_by_status, ->(status) { where(status: status) }
  scope :filter_by_author, ->(author_id) { where(author_id: author_id) }
  scope :sort_by_title, ->(sort) { order(title: sort) }
  scope :find_post, ->(keywords) { where("title || body ILIKE ?", "%#{keywords}%") }
end
