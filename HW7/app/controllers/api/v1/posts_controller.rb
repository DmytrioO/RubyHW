class Api::V1::PostsController < ApplicationController
  def index
    posts = Post.all

      render json: { status: 'SUCCESS', message: 'Fetched all the posts successfully', data: posts }, status: :ok
  end

  def show
    post = Post.find(params[:id])
    comments = post.comments
    likes = Post.find(params[:id]).likes.count
    response = { post: post, likes: likes, comments: comments.last_ten }

    render json: { data: response }, state: :ok
  end

  def create
    post = Post.new(post_params)

    if post.save
      render json: { status: 'SUCCESS', message: 'Post was created successfully!', data: post }, status: :created
      create_tags(post.tags)
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  def update
    post = Post.find(params[:id])

    if post.update(post_params)
      render json: { message: 'Post was updated successfully', data: post }, status: :ok
      create_tags(post.tags)
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
    params.require(:post).permit(:title, :body, :author_id, :tags)
  end

  def create_tags(tags)
    tag_list = tags.split(',')
    list_length = tag_list.length
    counter = 0
    while counter < list_length
      tag = tag_list[counter]
      unique_tag = 1
      tag_all = Tag.ids
      tag_count = tag_all.length
      count_all = 0
      while count_all < tag_count
        tag_from_list = Tag.find(tag_all[count_all])
        if tag == tag_from_list.name
          unique_tag = 0
        end
        count_all += 1
      end
      if unique_tag == 1
        Tag.create(name:tag)
      end
      counter += 1
    end
  end
end