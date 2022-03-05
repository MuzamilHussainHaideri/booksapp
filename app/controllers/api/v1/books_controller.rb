class Api::V1::BooksController < ApplicationController

  def index
    render json: Book.all, root: false
  end

  def show
    render json: Book.find(params[:id])

  end
  def new
    render json: Book.new(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      render json: {notice:"created"}, status: 201
    else
      render json: {notice:"not creates"}, status: :unposible_entity
    end
  end
end

def book_params
  params.require(:book).permit( :name, :description, :author,:image)
end