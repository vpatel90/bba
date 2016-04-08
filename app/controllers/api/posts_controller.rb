class Api::PostsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    render json: Post.order(votes_count: :DESC)
  end

  def show
    response = Post.find(params[:post][:id])
    if response.nil?
      raise ActiveRecord::RecordNotFound
    end
    render json: response.to_json(include: :comments)
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end

  def create
    post = Post.create(title: params[:post][:title],
                       description: params[:post][:body],
                       pic: params[:post][:pic])
    render json: post
  rescue ActiveRecord::RecordInvalid
    render json: { message: "Invalid Input", status: 400 }, status: 400
  end

  def update
    post = Post.find(params[:id])
    post.update(title: params[:post][:title],
                description: params[:post][:body],
                pic: params[:post][:pic])
    render json: post
  rescue ActiveRecord::RecordInvalid
    render json: { message: "Invalid Input", status: 400 }, status: 400
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404

  end

  def destroy
    post = Post.find(params[:post][:id])
    post.destroy
    render json: { message: "Success", status: 200 }
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end
end
