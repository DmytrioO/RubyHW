class Author < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  validates :name, :lastname, :email, presence: true
  validates :email, uniqueness: true
end
