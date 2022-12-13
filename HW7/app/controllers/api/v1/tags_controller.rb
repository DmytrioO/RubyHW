class Api::V1::TagsController < ApplicationController
  def index
    tags = Tag.all
    render json: { status: 'SUCCESS', message: 'Fetched all the tags successfully', data: tags }, status: :ok
  end

  def show
    tag = Tag.find(params[:id])
    posts = tag.posts
    response = { tag: tag, posts: posts }
    render json: { data: response }, state: :ok
  end

  def create
    tag = Tag.new(tag_params)

    if tag.save
      render json: { status: 'SUCCESS', message: 'Tag was created successfully!', data: tag }, status: :created
    else
      render json: tag.errors, status: :unprocessable_entity
    end
  end

  def update
    tag = Tag.find(params[:id])

    if tag.update(tag_params)
      render json: { message: 'Tag was updated successfully', data: tag }, status: :ok
    else
      render json: { message: 'Tag cannot be updated' }, status: :unprocessable_entity
    end
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

  def tag_params
    params.require(:tag).permit(:name)
  end
end