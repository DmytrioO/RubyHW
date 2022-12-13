class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :post
  has_many :likes, as: :likeable

  enum :status, %i[unpublished published]

  validates :body, presence: true

  scope :last_ten, -> { last(10) }
end
