class Api::V1::PostSerializer::CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :status
  attribute :author, serializer: AuthorSerializer
  attributes :created_at
end
