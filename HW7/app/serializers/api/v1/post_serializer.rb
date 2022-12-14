class Api::V1::PostSerializer < ActiveModel::Serializer
  belongs_to :author
  has_many :comments
  attributes :id, :title, :body
  attribute :author, serializer: AuthorSerializer
  attribute :created_at
  attribute :comments, serializer: CommentSerializer
end
