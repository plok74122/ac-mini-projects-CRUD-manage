class BooksController < ApplicationController
  before_action :set_book_params, :only => [:create, :update]
  before_action :find_book, :only => [:show, :edit, :update, :destroy]

  def index
    @book_list=Book.includes(:book_condition).page(params[:page]).per(10)
    @book = Book.includes(:book_condition).find_by_id(params[:edit]) || Book.new
    if @book.new_record?
      flash[:alert] = 'This book id is not exist! . Create it?'
    end
  end

  def show
    if !@book.present?
      flash[:alert] = 'This book id is not exist! . Create it?'
      redirect_to new_book_path
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(set_book_params)
    if @book.save
      flash[:notice] = "Successfully created a new book!"
      redirect_to book_path(@book)
    else
      render :index
    end
  end

  def edit

  end

  def update
    if @book.update(set_book_params)
      flash[:notice] = "Successfully updated this book!"
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    if !@book.present?
      flash[:notice] = "This book is not exist!"
      redirect_to books_path
    else
      @book.destroy
      flash[:notice] = "Successfully delete book #{@book.id}!"
      redirect_to books_path
    end
  end

  private
  def set_book_params
    params.require(:book).permit(:name, :description, :cost, :book_condition_id)
  end

  def find_book
    @book = Book.includes(:book_condition).find_by_id(params[:id])
  end
end
