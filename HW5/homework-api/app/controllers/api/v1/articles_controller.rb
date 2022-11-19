class Api::V1::ArticlesController < ApplicationController
  def index
    articles = Article.all

    if articles
      render json: {status: 'SUCCESS', message: 'Fetched all the articles successfully', data: articles}, status: :ok
    else
      render json: articles.errors, status: :bad_request
    end
  end

  def create
    article = Article.new(article_params)

    if article.save
      render json: {status: 'CREATED', message: 'Article was created successfully!', data: article}, status: :created
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  def show
    article = Article.find(params[:id])

    if article
      render json: {data: article}, status: :ok
    else
      render json: {status: 'NOT FOUND', message: 'Article could not be found'}, status: :bad_request
    end
  end

  def destroy
    article = Article.find(params[:id])

    if article.destroy!
      render json: {status: 'SUCCESS', message: "Article was deleted successfully!"}, status: :ok
    else
      render json: {status: 'NOT FOUND', message: 'Article could not be found'}, status: :bad_request
    end
  end

  def update
    article = Article.find(params[:id])

    if article.update!(article_params)
      render json: {status: 'SUCCESS', message: "Article was updated successfully", data: article}, status: :ok
    else
      render json: {message: "Article cannot be updated"}, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end