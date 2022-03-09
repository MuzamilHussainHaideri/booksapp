class Api::V1::UserController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: User.all, root: false
  end

  def show
    render json: User.find(params[:id])

  end

  def new
    render json: User.new(params[:id])
  end

  def create
    @user = User.new(book_params)
    if @user.save
      render json: {notice:"created"}, status: 201
    else
      render json: {notice:"not creates"}, status: :unposible_entity
    end
  end
end

def user_params
  params.require(:user).permit(:id, :name)
end
