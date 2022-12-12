class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :post
  has_many :likes, as: :likeable

  enum :status, [:unpublished, :published]

  validates :body, :status, presence: true

  scope :show_unpublished, -> { where(status: 0) }
  scope :show_published, -> { where(status: 1) }
  scope :last_ten, -> { last(10) }
end
