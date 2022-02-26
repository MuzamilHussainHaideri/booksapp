class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destory]

  def index
    @books = Book.all.order("created_at DESC")

  end

  def new
    @book = Book.new
  end

  def show
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :description, :author)
  end

  def find_book
    @book = Book.find_by(params[:id])
  end
end
