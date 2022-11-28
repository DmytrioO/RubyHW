class Api::V1::CommentsController < ApplicationController
  def index
    comments = Comment.all

    if comments
      render json: { status: "SUCCESS", message: "Fetched all the comments successfully", data: comments }, status: :ok
    end
  end

  def show
    comment = Comment.find(params[:id])

    if comment
      render json: { data: comment }, state: :ok
    end
  end

  def create
    comment = Comment.new(create_comment_params)

    if comment.save
      render json: { status: "SUCCESS", message: "Comment was created successfully!", data: comment }, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  def update
    comment = Comment.find(params[:id])

    if comment.update(update_comment_params)
      render json: { message: "Comment was updated successfully", data: comment }, status: :ok
    else
      render json: { message: "Comment cannot be updated" }, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])

    if comment.destroy
      render json: { message: "Comment was deleted successfully" }, status: :ok
    else
      render json: { message: "Comment does not exist" }, status: :bad_request
    end
  end

  private

  def create_comment_params
    params.require(:comment).permit(:body, :status, :author_id, :post_id)
  end

  def update_comment_params
    params.require(:comment).permit(:body, :status)
  end
end