class Api::PostsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    posts = Post.order(votes_count: :DESC).page params[:page]
    render json: posts
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

  def vote
    post = Post.find(params[:vote][:post_id])
    vote = post.votes.build(vote_params)
    if vote.save
      render json: { message: "Success", status: 200 }
    else
      render json: vote.errors.each {|error| error}
    end
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

  def vote_params
    params.require(:vote).permit(:user_id, :post_id)
  end
end
