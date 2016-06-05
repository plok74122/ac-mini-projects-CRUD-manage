class BooksController < ApplicationController
  before_action :set_book_params, :only => [:create , :update]
  before_action :find_book, :only => [:show ,:edit ,:update ,:destroy]

  def index
    @book=Book.includes(:book_condition).all
  end

  def show
    if !@book.present?
      redirect_to new_book_path
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(set_book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @book.update(set_book_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private
  def set_book_params
    params.require(:book).permit(:name, :description, :cost, :book_condition_id)
  end

  def find_book
    @book = Book.includes(:book_condition).find_by_id(params[:id])
  end
end
