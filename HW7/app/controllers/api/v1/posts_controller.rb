class Api::V1::PostsController < ApplicationController
  include Pagy::Backend

  before_action :set_post, only: [:show, :update, :destroy]

  def index
    posts = Post.all
    #http://127.0.0.1:3000/api/v1/posts?search=keywords
    posts = posts.search(params[:search]) if params[:search]
    #http://127.0.0.1:3000/api/v1/posts?status=unpublished/published
    posts = posts.filter_by_status(params[:status]) if params[:status]
    #http://127.0.0.1:3000/api/v1/posts?author_id=1
    posts = posts.filter_by_author(params[:author]) if params[:author]
    #http://127.0.0.1:3000/api/v1/posts?tags=tag1,tag2,tag3
    posts = posts.filter_by_tags(params[:tags].split(', ')).distinct if params[:tags]
    #http://127.0.0.1:3000/api/v1/posts?sort=asc/desc
    posts = posts.sort_by_title(params[:sort]) if params[:sort]
    @pagy, @posts = pagy(posts, items: 15)
    response = { posts: @posts, info: @pagy }
    render json: { status: 'SUCCESS', message: 'Fetched all the posts successfully', data: response }, status: :ok
  end

  def show
    render json: @post, serializer: Api::V1::PostSerializer, state: :ok
  end

  def create
    post = Post.new(post_params)

    if post.save
      render json: { status: 'SUCCESS', message: 'Post was created successfully!', data: post }, status: :created
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update!(post_params)
      render json: { message: 'Post was updated successfully', data: @post }, status: :ok
    else
      render json: { message: 'Post cannot be updated' }, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.destroy
      render json: { message: 'Post was deleted successfully' }, status: :ok
    else
      render json: { message: 'Post does not exist' }, status: :bad_request
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :status, :author_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end