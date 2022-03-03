class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destory]
  before_action :authenticate_user!, only: [:new, :edit]
  

  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)
    
  end

  def new
    @book = current_user.books.build
  end

  def show

  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      redirect_to 'edit'
    end
  end

  def destory
    @book.destory
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit( :name, :description, :author,:image)
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
