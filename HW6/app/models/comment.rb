class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :post

  enum :status, [:unpublished, :published]

  validates :body, :status, presence: true
end
