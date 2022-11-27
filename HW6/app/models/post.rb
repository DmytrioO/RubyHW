class Post < ApplicationRecord
  belongs_to :author
  has_many :comments

  validates :title, :body, presence: true
end
