class Api::V1::PostsController < ApplicationController
  include Pagy::Backend

  before_action :set_post, only: [:show, :update, :destroy]

  def index
    posts = Post.all
    if params[:status] then posts = posts.where(status: params[:status]) end
    if params[:author_id] then posts = posts.where(author_id: params[:author_id]) end
    if params[:tags]
      filtered_ids = []
      tags_array = params[:tags].split(', ')
      post_ids = posts.all.ids
      coincidence = 1
      post_ids.each do |post_id|
        post = posts.find(post_id)
        tags_ids = post.tags.ids
        tags_array.each do |tag|
          coincidence = 0
          tags_ids.each do |tag_id|
            post_tag = Tag.find(tag_id)
            if post_tag.name.downcase == tag.downcase
              coincidence = 1
            end
          end
          if coincidence == 0 then break end
        end
        if coincidence == 1 then filtered_ids.push(post.id) end
      end
      unless filtered_ids.empty? then posts = posts.where(id: filtered_ids)
      else posts = nil end
    end
    if posts != nil
      if params[:sort] then posts = posts.order(title: params[:sort]) end
      @pagy, @records = pagy(posts.all, items: 15)
      response = { posts: @records, info: @pagy }
      render json: { status: 'SUCCESS', message: 'Fetched all the posts successfully', data: response }, status: :ok
    else
      render json: { status: 'NOT FOUND', message: 'No posts were found with these parameters' }, status: :not_found
    end
  end

  def show
    render json: @post, each_serializer: Api::V1::PostSerializer, state: :ok
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
    if @post.update(post_params)
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
    params.require(:post).permit(:title, :body, :author_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end