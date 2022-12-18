class Api::V1::PostSerializer::CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :status, :author, :created_at

  def author
    author = Author.find(object.author_id)
    "#{author.name} #{author.lastname}"
  end
end
