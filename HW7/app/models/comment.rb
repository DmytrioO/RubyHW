class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :post
  has_many :likes

  enum :status, [:unpublished, :published]

  validates :body, :status, presence: true

  scope :show_unpublished, -> { where(status: 0) }
  scope :show_published, -> { where(status: 1) }
  scope :last_ten, -> { self.reverse.take(10).reverse }
end
