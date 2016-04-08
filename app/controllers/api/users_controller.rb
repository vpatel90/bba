class Api::UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    render json: User.all.to_json(except: :password_digest)
  end

  def show
    response = User.find(params[:id])
    if response.nil?
      raise ActiveRecord::RecordNotFound
    end
    render json: response.to_json(except: :password_digest)
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end

  def create
    user = User.create(user_params)
    render json: user.to_json(except: :password_digest)
  rescue ActiveRecord::RecordInvalid
    render json: { message: "Invalid Input", status: 400 }, status: 400
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    render json: user.to_json(except: :password_digest)
  rescue ActiveRecord::RecordInvalid
    render json: { message: "Invalid Input", status: 400 }, status: 400
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: { message: "Success", status: 200 }
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end

  private

  def user_params
    params.require(:post).permit(:name, :email, :password, :password_confirmation)
  end
end
