class Api::V1::CommentsController < ApplicationController
  def index
    comments = Comment.all
    watch_status
    puts @status_watch

    if @status_watch.to_s == '{"status"=>1}' || @status_watch.to_s == '{"status"=>"published"}'
      render json: { status: 'SUCCESS', message: 'Fetched published comments successfully', data: comments.show_published }, status: :ok
    end
    if @status_watch.to_s == '{"status"=>0}' || @status_watch.to_s == '{"status"=>"unpublished"}'
      render json: { status: 'SUCCESS', message: 'Fetched unpublished comments successfully', data: comments.show_unpublished }, status: :ok
    end
    if @status_watch.to_s == '{"status"=>"all"}'
      render json: { status: 'SUCCESS', message: 'Fetched all the comments successfully', data: comments }, status: :ok
    end
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

  def watch_status
    @status_watch = params.require(:comment).permit(:status)
  end
end