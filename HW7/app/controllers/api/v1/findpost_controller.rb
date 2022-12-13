class Api::V1::FindpostController < ApplicationController
  def index
    keywords = params[:keywords].to_s
    result = Post.where("title ILIKE ? OR body ILIKE ?", "%#{keywords}%", "%#{keywords}%")
    render json: { data: result }
  end
end