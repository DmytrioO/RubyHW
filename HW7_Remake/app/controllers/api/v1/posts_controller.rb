class Api::V1::PostsController < ApplicationController
  def index
    posts = Post.all
    render json: { status: 'SUCCESS', message: 'Fetched all the posts successfully', data: posts }, status: :ok
  end

  def show
    post = Post.find(params[:id])
    comments = post.comments
    likes_count = post.likes.count
    tags = post.tags
    response = { post: post, tags: tags, likes: likes_count, comments: comments.last_ten }
    render json: { data: response }, state: :ok
  end

  def create
    post = Post.new(create_post_params)

    if post.save
      render json: { status: 'SUCCESS', message: 'Post was created successfully!', data: post }, status: :created
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  def update
    post = Post.find(params[:id])

    if post.update(update_post_params)
      render json: { message: 'Post was updated successfully', data: post }, status: :ok
    else
      render json: { message: 'Post cannot be updated' }, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:id])

    if post.destroy
      render json: { message: 'Post was deleted successfully' }, status: :ok
    else
      render json: { message: 'Post does not exist' }, status: :bad_request
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :author_id)
  end
end