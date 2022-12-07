class Api::V1::LikesController < ApplicationController
  def index
    likes = Like.all
    render json: { status: 'SUCCESS', message: 'Fetched all the likes successfully', data: likes }, status: :ok
  end

  def create
    like = Like.new(like_params)

    if like.save
      render json: { status: 'SUCCESS', message: 'Like was created successfully!', data: like }, status: :created
    else
      render json: like.errors, status: :unprocessable_entity
    end
  end

  def destroy
    like = Like.find(params[:id])

    if like.destroy
      render json: { message: 'Like was deleted successfully' }, status: :ok
    else
      render json: { message: 'Like does not exist' }, status: :bad_request
    end
  end

  private

  def like_params
    params.require(:like).permit(:post_id, :comment_id, :author_id)
  end
end