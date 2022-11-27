class Author < ApplicationRecord
  has_many :posts
  has_many :comments

  validates :name, :lastname, :email, presence: true
  validates :email, uniqueness: true
end
