class Api::V1::AuthorsController < ApplicationController
  def index
    authors = Author.all

    render json: { status: 'SUCCESS', message: 'Fetched all the authors successfully', data: authors }, status: :ok
  end

  def show
    author = Author.find(params[:id])

    render json: { data: author }, state: :ok
  end

  def create
    author = Author.new(author_params)

    if author.save
      render json: { status: 'SUCCESS', message: 'Author was created successfully!', data: author }, status: :created
    else
      render json: author.errors, status: :unprocessable_entity
    end
  end

  def update
    author = Author.find(params[:id])

    if author.update(author_params)
      render json: { message: 'Author was updated successfully', data: author }, status: :ok
    else
      render json: { message: 'Author cannot be updated' }, status: :unprocessable_entity
    end
  end

  def destroy
    author = Author.find(params[:id])

    if author.destroy
      render json: { message: 'Author was deleted successfully' }, status: :ok
    else
      render json: { message: 'Author does not exist' }, status: :bad_request
    end
  end

  private

  def author_params
    params.require(:author).permit(:name, :lastname, :email)
  end
end