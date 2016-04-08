class Api::PostsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    render json: Post.order(votes_count: :DESC)
  end

  def show
    response = Post.find(params[:id])
    if response.nil?
      raise ActiveRecord::RecordNotFound
    end
    render json: response
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end

  def create
    post = Post.create(post_params)
    render json: post
  rescue ActiveRecord::RecordInvalid
    render json: { message: "Invalid Input", status: 400 }, status: 400
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    render json: post
  rescue ActiveRecord::RecordInvalid
    render json: { message: "Invalid Input", status: 400 }, status: 400
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404

  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    render json: { message: "Success", status: 200 }
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :pic)
  end
end
