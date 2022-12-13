class Api::V1::CommentsController < ApplicationController
  def index
    comments = Comment.all
    if params[:status] then comments = comments.where(status: params[:status]) end
    render json: { status: 'SUCCESS', message: 'Fetched comments successfully', data: comments }, status: :ok
  end

  def show
    comment = Comment.find(params[:id])
    likes_count = comment.likes.count
    response = { comment: comment, likes: likes_count }
    render json: { data: response }, state: :ok
  end

  def create
    comment = Comment.new(comment_params)

    if comment.save
      render json: { status: 'SUCCESS', message: 'Comment was created successfully!', data: comment }, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  def update
    comment = Comment.find(params[:id])

    if comment.update(comment_params)
      render json: { message: 'Comment was updated successfully', data: comment }, status: :ok
    else
      render json: { message: 'Comment cannot be updated' }, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])

    if comment.destroy
      render json: { message: 'Comment was deleted successfully' }, status: :ok
    else
      render json: { message: 'Comment does not exist' }, status: :bad_request
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :status, :author_id, :post_id)
  end
end