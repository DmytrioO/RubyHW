class Api::V1::PostSerializer < ActiveModel::Serializer
  has_many :comments
  attributes :id, :title, :body, :author, :created_at
  #attribute :comments, serializer: CommentSerializer

  def author
    author = Author.find(object.author_id)
    "#{author.name} #{author.lastname}"
  end
end
