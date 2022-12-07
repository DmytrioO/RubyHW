class Api::V1::TagsController < ApplicationController
  def index
    tags = Tag.all

    render json: { status: 'SUCCESS', message: 'Fetched all the tags successfully', data: tags }, status: :ok
  end

  def show
    tag = Tag.find(params[:id])
    find_tag_usage(tag.name)
    response = { tag: tag, posts: @tag_usages.sort }

    render json: { data: response }, state: :ok
  end

  def destroy
    tag = Tag.find(params[:id])

    if tag.destroy
      render json: { message: 'Tag was deleted successfully' }, status: :ok
    else
      render json: { message: 'Tag does not exist' }, status: :bad_request
    end
  end

  private

  def find_tag_usage(tag)
    @tag_usages = []
    posts_ids = Post.ids
    count_limit = posts_ids.length
    counter = 0
    while counter < count_limit
      post = Post.find(posts_ids[counter])
      if post.tags != nil
        post_tags = post.tags.split(',')
        tags_length = post_tags.length
        tags_count = 0
        while tags_count < tags_length
          if tag == post_tags[tags_count]
            @tag_usages.push(post)
          end
          tags_count += 1
        end
      end
      counter += 1
    end
  end
end